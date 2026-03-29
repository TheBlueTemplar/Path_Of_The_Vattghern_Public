::TLW.HooksMod.hook("scripts/skills/traits/fear_greenskins_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		return [
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
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=%negative%]-10[/color] Resolve when in battle with greenskins"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=%negative%]-5%[/color] Melee Skill when in battle with greenskins"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=%negative%]-5%[/color] Ranged Skill when in battle with greenskins"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "[color=%negative%]-5%[/color] Damage when in battle with greenskins"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}

		local fightingGreenskins = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (this.Const.EntityType.getDefaultFaction(enemy.getType()) == this.Const.FactionType.Orcs || this.Const.EntityType.getDefaultFaction(enemy.getType()) == this.Const.FactionType.Goblins)
			{
				fightingGreenskins = true;
				break;
			}
		}

		if (fightingGreenskins)
		{
			_properties.Bravery -= 10;
			_properties.MeleeSkillMult *= 0.95;
			_properties.RangedSkillMult *= 0.95;
			_properties.DamageTotalMult *= 0.95;
			// Make this a status effect so it will be visible for the battle
			this.m.Type = ::Const.SkillType.StatusEffect;
		} else {
			// Make this a trait so it will not be visible for the battle
			this.m.Type = ::Const.SkillType.Trait;
		}
	}

})
