::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_armor_cloak_heavy", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Description = "A rustic cloak made of thick layered strong warm wool, provides protection from the weather and some blows but is quite hefty.";
	}

	q.getTooltip = @(__original) function()
	{
		local result = this.legend_armor_cloak.getTooltip();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/pov_rain.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Immunity[/color] To rainfall debuffs."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/pov_rain.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Immunity[/color] To rainfall debuffs."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.IsAffectedByRain = false;
	}

});

