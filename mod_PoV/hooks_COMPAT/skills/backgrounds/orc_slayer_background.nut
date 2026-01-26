::TLW.HooksMod.hook("scripts/skills/backgrounds/orc_slayer_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done against greenskins increased by [color=" + this.Const.UI.Color.PositiveValue + "]14%[/color]."
			}
		);
		return ret;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null)
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Orcs || this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Goblins || _targetEntity.getFlags().has("pov_mutant_orc") || _targetEntity.getFlags().has("pov_mutant_goblin"))
			{
				_properties.DamageTotalMult *= 1.14;
			}
		}	
	}
})
