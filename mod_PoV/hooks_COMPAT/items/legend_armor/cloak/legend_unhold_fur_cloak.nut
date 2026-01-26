::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_unhold_fur_cloak", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1500; //up from 1000
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -3;
	}

	q.getTooltip = @(__original) function()
	{
		local result = this.legend_armor_cloak.getTooltip();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=%negative%]-30%[/color]"
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=%negative%]-30%[/color]"
		});
	}

	q.onBeforeDamageReceived = @(__original) function( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			_properties.DamageReceivedRangedMult *= 0.70;
		}
	}

});

