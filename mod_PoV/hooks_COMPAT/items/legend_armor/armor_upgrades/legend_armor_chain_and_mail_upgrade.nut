::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_armor_chain_and_mail_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1500; // down from 3000
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
	}

	q.getTooltip = @(__original) function()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=%positive%]+5[/color] Resolve"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increases enemy desire to attack you in battle"
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=%positive%]+5[/color] Resolve"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increases enemy desire to attack you in battle"
		});
	}
	q.onUpdateProperties = @(__original) function (_properties)
	{
		//__original(_properties);
		_properties.Bravery += 5;
		_properties.TargetAttractionMult *= 1.5;
	}
});

