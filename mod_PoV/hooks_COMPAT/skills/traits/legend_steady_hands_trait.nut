::TLW.HooksMod.hook("scripts/skills/traits/legend_steady_hands_trait", function (q) {
	q.getTooltip = @(__original) function () {
		local ret = __original();
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "All Ranged Damage done increased by [color=" + this.Const.UI.Color.PositiveValue + "]4[/color]."
		});
		return ret;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties) {
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && !_skill.isGarbage() && _skill.isRanged()) {
			_properties.DamageRegularMin += 4;
			_properties.DamageRegularMax += 4;
		}
	}

})
