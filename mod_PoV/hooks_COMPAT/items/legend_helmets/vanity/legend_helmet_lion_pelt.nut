::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_lion_pelt", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 600;
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
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]-2[/color]."
		});
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color] more likely to attack you."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] resolve."
		});
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]-2[/color]."
		});
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color] more likely to attack you."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Bravery += 1;
		_properties.Threat += 2;
		_properties.TargetAttractionMult *= 1.15;
	}

});

