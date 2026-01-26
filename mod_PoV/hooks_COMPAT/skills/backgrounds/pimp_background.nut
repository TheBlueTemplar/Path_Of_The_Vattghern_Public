::TLW.HooksMod.hook("scripts/skills/backgrounds/pimp_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done against women increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			}
		);
		return ret;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null)
		{
			if(_targetEntity.getFlags().has("human") && _targetEntity.getGender() == 1)
			{
				_properties.DamageTotalMult *= 1.10;
			}
		}	
	}
})
