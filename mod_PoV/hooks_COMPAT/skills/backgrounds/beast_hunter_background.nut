::TLW.HooksMod.hook("scripts/skills/backgrounds/beast_hunter_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done against beasts increased by [color=" + this.Const.UI.Color.PositiveValue + "]6%[/color]."
			}
		);
		return ret;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null)
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Beasts)
			{
				_properties.DamageTotalMult *= 1.06;
			}
		}	
	}
})
