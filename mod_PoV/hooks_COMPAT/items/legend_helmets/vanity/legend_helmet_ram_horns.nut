::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_ram_horns", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 325;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]-2[/color]."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]-2[/color]."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Threat += 2;
	}

});

