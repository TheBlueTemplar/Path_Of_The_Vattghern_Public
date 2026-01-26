::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_dervish_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "Reduced Damage Taken by [color=" + this.Const.UI.Color.PositiveValue + "]4%[/color]."
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Increases Resolve by [color=" + this.Const.UI.Color.PositiveValue + "]4%[/color]."
			}
		);
		return ret;
	}

	q.onBeforeDamageReceived = @(__original) function( _attacker, _skill, _hitInfo, _properties )
	{
		__original(_attacker, _skill, _hitInfo, _properties);
		_properties.DamageReceivedTotalMult *= 0.96;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.BraveryMult *= 1.03;
	}
})
