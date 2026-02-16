this.pov_unstable_mutant_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_unstable_mutant";
		this.m.Name = "Unstable Mutant";
		this.m.Icon = "ui/traits/pov_mutant.png";
		this.m.Description = "%name% is a [color=" + this.Const.UI.Color.povPerkBlue + "]Mutant[/color], thus having access to mutations. These mutations, being unstable and unrefined compared to the vattghern ones, come at a steep cost though, both to their own strength, but also to the character\'s overall health.";
		this.m.Order = this.Const.SkillOrder.Background;
	}

	getMutationLimit = function()
	{
		local actor = this.getContainer().getActor();
		// Checks For Mutation Limit
		local mutationCount = this.getMutations();
		local mutationLimit = 2;

		if (actor.getFlags().has("playerMutantPlus"))
		{
			mutationLimit = 3;
		}

		// loop over all mutations defined in ::TLW.PlayerMutation
	    foreach (key, mut in ::TLW.PlayerMutation)
	    {
	        // skip ones that count toward the limit
	        if (mut.Limit) continue;

	        // if actor has the skill from this mutation, subtract 1
	        local script = this.new(mut.Script);
	        if (actor.getSkills().hasSkill(script.getID()))
	        {
	            mutationCount -= 1;
	        }
	    }

	    // Fallback
		if (mutationCount < 0){mutationCount = 0;}

		local result = mutationLimit - mutationCount;

		// Fallback
		if (result <= 0){result = 0;}

		return result;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		local mutations = this.getMutations();
		if (mutations == 1)
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/pov_mutagen_shard_icon.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + mutations + "[/color] Mutation"
			});
		} else {
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/pov_mutagen_shard_icon.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + mutations + "[/color] Mutations"
			});
		}

		local limit = this.getMutationLimit();
		if (limit > 1)
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Can get [color=" + this.Const.UI.Color.PositiveValue + "]" + limit + "[/color] More Mutations"
			});
		} else if (limit == 1) {
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Can get [color=" + this.Const.UI.Color.PositiveValue + "]" + limit + "[/color] More Mutation"
			});
		} else {
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot[/color] get more [color=" + this.Const.UI.Color.povPerkBlue + "]normal[/color] Mutations"
			});
		}

		if (::World.Assets.getOrigin() != null)
		{
			if (this.World.Assets.getOrigin().getID() != "scenario.pov_mutants")
			{
				result.push({
					id = 19,
					type = "text",
					icon = "ui/icons/asset_food.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]+33%[/color] Food Consumption"
				});

				result.push({
					id = 11,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "This character\'s lost health recovers [color=" + this.Const.UI.Color.NegativeValue + "]30%[/color] slower."
				});

				result.push({
					id = 11,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "Injury threshold reduced by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]."
				});

				result.push({
					id = 10,
					type = "text",
					icon = "ui/icons/mood_02.png",
					text = "Periodically suffers [color=" + this.Const.UI.Color.NegativeValue + "]reduced mood[/color] due to the unstable mutations."
				});
			}
		}		

		return result;

	}

	function onUpdate( _properties )
	{
		if (::World.Assets.getOrigin() != null)
		{
			if (this.World.Assets.getOrigin().getID() != "scenario.pov_mutants")
			{
				_properties.DailyFood *= 1.33;
				_properties.HitpointsRecoveryRateMult *= 0.7;
				_properties.ThresholdToReceiveInjuryMult *= 0.9;
			}
		}		

		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
		}else
		{
			// If in battle, then this should be a status effect
			this.m.Type = ::Const.SkillType.StatusEffect;
			this.m.Order = this.Const.SkillOrder.Background;
		}
	}

	function onNewDay()
	{
		local actor = this.getContainer().getActor();
		// 20% chance overall of mood drop, if not mutant scenario
		if (::World.Assets.getOrigin() != null)
		{
			if (this.World.Assets.getOrigin().getID() != "scenario.pov_mutants")
			{
				if (this.Math.rand(1,100) <= 18)
				{
					actor.worsenMood(0.5, "Feeling discomfort due to mutations");
				}
				else if (this.Math.rand(1,100) <= 3)
				{
					actor.worsenMood(1, "Hurting due to mutations");
				}
			}
		}		
	}

	function getMutations()
	{
		return this.getContainer().getActor().getFlags().getAsInt("pov_ActiveMutations");
	}

});

