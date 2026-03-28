::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_wizard_cowl", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 750;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] initiative."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] initiative."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Initiative += 3;
	}

});

