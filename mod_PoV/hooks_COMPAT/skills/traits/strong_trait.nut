::TLW.HooksMod.hook("scripts/skills/traits/strong_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "All Damage done increased by [color=" + this.Const.UI.Color.PositiveValue + "]3[/color]."
			}
		);
		return ret;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _skill.isAttack())
		{
			_properties.DamageRegularMin += 3;
			_properties.DamageRegularMax += 3;
		}
	}

})
