this.pov_raise_banner <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.pov_raise_banner";
		this.m.Name = "Raise the Banner!!";
		this.m.Description = "Raise the banner! Give it your all!! For the Company!!!.\n\n Put your soul into inspiring the company. Will attempt to rally people fleeing, remove charm and sleep, as well as raise the morale of the rest. At the same time, such a display of resolve has a chance to reduce nearby enemie\'s morale.\n\n This skill is very exerting, and will need a few days of recovery, before being usable again.";
		this.m.Icon = "skills/pov_active_raise_banner.png";
		this.m.IconDisabled = "skills/pov_active_raise_banner_sw.png";
		this.m.Overlay = "pov_active_raise_banner";
		this.m.SoundOnUse = [
			"sounds/combat/pov_raise_banner.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 7;
		this.m.FatigueCost = 40;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	// 50% of resolve (used for BOTH ally bonus and enemy penalty)
	function getBonus()
	{
		local resolve = this.getContainer().getActor().getCurrentProperties().getBravery();
		return this.Math.max(0, this.Math.floor(resolve * 0.50));
	}

	function getTooltip()
	{
		local bonus = this.getBonus();

		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Allies within 8 tiles make a morale check to improve morale, with a Resolve bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] (50% of the user's Resolve), reduced by [color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] per tile distance. Can also rally fleeing allies."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Enemies within 8 tiles make a morale check that can worsen morale, with a Resolve penalty of [color=" + this.Const.UI.Color.NegativeValue + "]-" + bonus + "[/color] (50% of the user's Resolve), reduced by [color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] per tile distance"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a chance (same as above) to remove the [color=" + this.Const.UI.Color.NegativeValue + "]sleeping[/color] and [color=" + this.Const.UI.Color.NegativeValue + "]charmed[/color] effects of anyone involved."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Will [color=" + this.Const.UI.Color.NegativeValue + "]Exert[/color] the user, slightly reducing resolve and preventing the use of this skill for a few days."
			}
		];

		if (this.getContainer().hasSkill("effects.pov_banner_exerted"))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Is exerted from using this skill. Needs a few days until able to use it again[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.pov_banner_exerted");
	}

	function onUse( _user, _targetTile )
	{
		local bonus = this.getBonus();
		local actors = this.Tactical.Entities.getAllInstancesAsArray();
		local myTile = _user.getTile();

		foreach (a in actors)
		{
			if (a == null || a.getID() == _user.getID())
			{
				continue;
			}

			local dist = myTile.getDistanceTo(a.getTile());

			// Max range = 8 distance
			if (dist > 8)
			{
				continue;
			}

			// --- Chance-based dispel (Sleeping + Charmed) ---
			local dispelChance = this.Math.min(100, this.Math.max(0, bonus - (dist * 5))); // e.g. bonus=50 => 50% chance, with distance 3: 35% chance
			local roll = this.Math.rand(1, 100);

			if (roll <= dispelChance)
			{
				::Legends.Effects.remove(a, ::Legends.Effect.Sleeping);
				::Legends.Effects.remove(a, ::Legends.Effect.Charmed);
				::Legends.Effects.remove(a, ::Legends.Effect.LegendIntenselyCharmed);
			}

			// Distance-scaled moraleCheck value: -5 per tile
			// Different formulas for Positive and Negative checks (opposite)
			// Max distance penalty = 40
			local moraleCheckPositive = bonus - (dist * 5);
			local moraleCheckNegative = (dist * 5) - bonus;

			// Allies: positive morale check
			if (a.getFaction() == _user.getFaction())
			{
				// Either rallies a fleeing guy, or just raises morale
				if (a.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					a.checkMorale(this.Const.MoraleState.Wavering - this.Const.MoraleState.Fleeing, moraleCheckPositive, this.Const.MoraleCheckType.Default, "pov_raise_banner_positive");
				}
				else
				{
					a.checkMorale(1, moraleCheckPositive, this.Const.MoraleCheckType.Default, "pov_raise_banner_positive");
				}
			}
			// Enemies: negative morale check
			else
			{
				a.checkMorale(-1, moraleCheckNegative, this.Const.MoraleCheckType.Default, "pov_raise_banner_negative");
			}
		}

		// Prevent the user from using it again / being affected same turn (vanilla behavior)
		local exerted = this.new("scripts/skills/effects/pov_banner_exerted_effect")
		// inspiring presence reduces cdr by one day
		if (_user.getSkills().hasPerk(::Legends.Perk.InspiringPresence))
		{
			exerted.m.Duration = 2;
		}
		this.getContainer().add(exerted);
		return true;
	}
});
