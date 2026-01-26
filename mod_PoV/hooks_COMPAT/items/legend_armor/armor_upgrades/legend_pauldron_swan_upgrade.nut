::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_pauldron_swan_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		//this.m.Description = "These segments of steel plate are extremely heavy but excellent for protecting shoulders and arms. Worn over common armor, they can help to deflect incoming blows.";
		//this.m.ArmorDescription = "Segments of steel plates provide additional protection.";
		this.m.Value = 1800; // down from 2700
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -5;
		this.m.DirectDamageModifier = 0.0;
	}

	q.getTooltip = @(__original) function()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=%negative%]-20%[/color]"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=%positive%]+3[/color] Ranged Defense"
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=%negative%]-20%[/color]"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=%positive%]+3[/color] Ranged Defense"
		});
	}

	q.onBeforeDamageReceived = @(__original) function( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			_properties.DamageReceivedRangedMult *= 0.80;
		}
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.RangedDefense += 3;
	}
});

