::TLW.HooksMod.hook("scripts/skills/backgrounds/servant_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Increases Resolve by [color=" + this.Const.UI.Color.PositiveValue + "]3%[/color]."
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is always content with being in reserve."
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "Damage Taken increased by [color=" + this.Const.UI.Color.NegativeValue + "]5%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.BraveryMult *= 1.04;
		_properties.IsContentWithBeingInReserve = true;
	}

	q.onBeforeDamageReceived = @(__original) function( _attacker, _skill, _hitInfo, _properties )
	{
		__original(_attacker, _skill, _hitInfo, _properties);
		_properties.DamageReceivedTotalMult *= 1.05;
	}
})
