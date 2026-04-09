::TLW.HooksMod.hook("scripts/skills/actives/legend_double_swing_skill", function ( q ) {

	q.m.IsHeavyGun <- false;

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Combined damage is reduced by [color=%negative%]-5%[/color] Damage (on top of the dual wield effect reduction)"
		});
		return ret;
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		if (_skill == this)
		{
			__original(_skill, _targetEntity, _properties);
			_properties.DamageTotalMult *= 0.95;
		}
	}
		
});	
