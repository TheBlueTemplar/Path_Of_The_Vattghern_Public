::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_undertakers_hat", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 320;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
	}

	q.getTooltip = @(__original) function()
	{
		local result =  __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/pov_rain.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Reduces[/color] harsh weather debuffs."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/pov_rain.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Reduces[/color] harsh weather debuffs."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.IsResistantToRain = true;
	}

});

