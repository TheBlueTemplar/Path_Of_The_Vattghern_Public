::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_leather_neckguard_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 375; // up from 250
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -2;
		this.m.DirectDamageModifier = 0.0;
	}

	q.getTooltip = @(__original) function()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=%negative%]-10%[/color]"
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=%negative%]-10%[/color]"
		});
	}

	q.onBeforeDamageReceived = @(__original) function( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			_properties.DamageReceivedRangedMult *= 0.90;
		}
	}

});

