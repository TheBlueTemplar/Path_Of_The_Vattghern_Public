::TLW.HooksMod.hook("scripts/skills/backgrounds/retired_soldier_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "Reduced Armor Damage Taken by [color=" + this.Const.UI.Color.PositiveValue + "]8%[/color]."
			}
		);
		return ret;
	}

	q.onBeforeDamageReceived = @(__original) function( _attacker, _skill, _hitInfo, _properties )
	{
		__original(_attacker, _skill, _hitInfo, _properties);
		_properties.DamageReceivedArmorMult *= 0.92;
	}
})
