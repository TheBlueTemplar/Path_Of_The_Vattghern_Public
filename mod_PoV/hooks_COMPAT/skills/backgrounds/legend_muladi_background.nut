::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_muladi_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "Ranged attack against beasts increased by [color=" + this.Const.UI.Color.PositiveValue + "]8%[/color]."
			}
		);
		return ret;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null && _skill.isRanged())
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Beasts)
			{
				_properties.RangedSkillMult *= 1.08;
			}
		}	
	}
})
