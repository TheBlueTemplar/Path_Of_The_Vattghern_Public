this.pov_yrden_skill <- this.inherit("scripts/skills/skill", {
	m = {
		//Cooldown = 0
	},
	function create()
	{
		this.m.ID = "actives.pov_yrden";
		this.m.Name = "Yrden Sign";
		this.m.Description = "Cast a cursed, foul miasma upon your living enemies, reducing their ranged capabilities and harming them.\n\n [color=" + this.Const.UI.Color.NegativeValue + "]2 Turns Cooldown[/color]";
		this.m.Icon = "skills/pov_active_yrden.png";
		this.m.IconDisabled = "skills/pov_active_yrden_sw.png";
		this.m.Overlay = "pov_active_yrden";
		this.m.SoundOnUse = [
			"sounds/enemies/miasma_spell_01.wav",
			"sounds/enemies/miasma_spell_02.wav",
			"sounds/enemies/miasma_spell_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		//intensity = 40; //test
		local rangeBoost = this.Math.floor(intensity / 15);
		local durationBoost = this.Math.floor(intensity / 30);
		local durationTotal = this.Math.max(1, 1 + durationBoost);

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
			}
		];

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/pov_intensity.png",
			text = "Current Sign Intensity: [color=" + this.Const.UI.Color.PositiveValue + "]"+ this.Math.round(intensity) +"%[/color]."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Creates a [color=" + this.Const.UI.Color.PositiveValue + "]Yrden Trap Zone[/color] which debuffs all enemies that stand on it, greatly reducing their Initiative, and slightly reducing their attack and defense. The zone\'s effect also disturbs some enemy abilities and effects."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles (Range is 1 + 1 for every 15% Sign Intensity). Zone Duration: [color=" + this.Const.UI.Color.PositiveValue + "]" + durationTotal + "[/color] Turns. (Duration: 1 + 1 for every 30% Sign Intensity)"
		});

		return ret;
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();
		return (!actor.getSkills().hasSkill("effects.pov_sign_cooldown") && this.skill.isUsable())
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInSigns ? 0.75 : 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInSigns ? 5 : 6;
	}

	function isViableTarget( _user, _target )
	{
		if (_target.isAlliedWith(_user))
		{
			return false;
		}

		if (_target.getFlags().has("undead"))
		{
			return false;
		}

		if (_target.getTile().Properties.Effect != null)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		//intensity = 40; //test
		local durationBoost = this.Math.floor(intensity / 30);
		local durationTotal = this.Math.max(1, 1 + durationBoost);

		local targets = [];
		targets.push(_targetTile);

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = _targetTile.getNextTile(i);
				targets.push(tile);
			}
		}

		local p = {
			Type = "miasma",
			Tooltip = "A Yrden Sign is placed here, debuffing all who approach. Also blocks some enemy abilities.",
			IsPositive = false,
			IsAppliedAtRoundStart = false,
			IsAppliedAtTurnEnd = true,
			IsAppliedOnMovement = false,
			IsAppliedOnEnter = true,
			IsByPlayer = false,
			Timeout = this.Time.getRound() + durationTotal,
			Callback = this.Const.Tactical.Common.onApplyPovYrden,
			function Applicable( _a )
			{
				return !_a.getFlags().has("undead");
			}

		};

		foreach( tile in targets )
		{
			if (tile.Properties.Effect != null && tile.Properties.Effect.Type == "miasma")
			{
				tile.Properties.Effect.Timeout = this.Time.getRound() + durationTotal;
			}
			else
			{
				if (tile.Properties.Effect != null)
				{
					this.Tactical.Entities.removeTileEffect(tile);
				}

				tile.Properties.Effect = clone p;

				local particles = [];
				for (local i = 0; i < this.Const.Tactical.YrdenSigilParticles.len(); i = ++i)
				{
					local e = this.Const.Tactical.YrdenSigilParticles[i];
					particles.push(this.Tactical.spawnParticleEffect(
						true, e.Brushes, tile, e.Delay, e.Quantity, e.LifeTimeQuantity, e.SpawnRate, e.Stages
					));
				}

				this.Tactical.Entities.addTileEffect(tile, tile.Properties.Effect, particles);

				if (tile.IsOccupiedByActor)
				{
					this.Const.Tactical.Common.onApplyPovYrden(tile, tile.getEntity());
				}
			}
		}

		return true;
	}

	/*function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		intensity = 40; //test
		local rangeBoost = this.Math.floor(intensity / 15);

		if (_skill == this)
		{
			this.removeMainhandBonuses(_properties);
			// Skill Stats
			//_skill.m.MaxRange = this.Math.max(1 , rangeBoost);
			_skill.m.MaxRange = _skill.getMaxRange() + this.Math.max(0 , rangeBoost);
		}
	}*/

	function onUpdate(_properties)
	{
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		//intensity = 40; //test
		local rangeBoost = this.Math.floor(intensity / 15);

		local skills = actor.getSkills().getAllSkillsOfType(this.Const.SkillType.Active);
		foreach (skill in skills)
		{
			if (skill.getID() == "actives.pov_yrden")
			{
				skill.m.MaxRange = skill.getMaxRange() + this.Math.max(0 , rangeBoost);
			}
		}
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill == this)
		{
			// Sign Cooldown
			local actor = this.getContainer().getActor();
	    	actor.getSkills().add(this.new("scripts/skills/effects/pov_sign_cooldown_effect"));
		}	
	}

});

