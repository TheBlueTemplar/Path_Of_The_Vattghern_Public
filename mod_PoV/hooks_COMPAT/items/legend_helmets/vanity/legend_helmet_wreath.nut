::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_wreath", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 580;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] resolve."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] resolve."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Bravery += 1;
	}

});

