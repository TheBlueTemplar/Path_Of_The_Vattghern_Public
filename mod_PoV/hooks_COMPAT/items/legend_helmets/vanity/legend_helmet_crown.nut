::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_crown", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1750;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] resolve."
		});
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.NegativeValue + "]40%[/color] more likely to attack you."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] resolve."
		});
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.NegativeValue + "]40%[/color] more likely to attack you."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Bravery += 5;
		_properties.TargetAttractionMult *= 1.40;
	}

});

