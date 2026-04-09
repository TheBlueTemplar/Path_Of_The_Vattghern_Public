::TLW.HooksMod.hook("scripts/items/legend_armor/cloth/legend_armor_robes_magic", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.Value = 1000;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] resolve."
		});
		return result;
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Bravery += 3;
	}

});

