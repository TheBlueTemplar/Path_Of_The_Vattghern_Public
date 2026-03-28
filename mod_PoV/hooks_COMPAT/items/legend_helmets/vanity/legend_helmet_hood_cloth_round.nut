::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_hood_cloth_round", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 175;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] less likely to attack you."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] less likely to attack you."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.TargetAttractionMult *= 0.90;
	}

});

