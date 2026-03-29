::TLW.HooksMod.hook("scripts/items/legend_armor/cloth/legend_robes", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
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

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Bravery += 1;
	}

});

