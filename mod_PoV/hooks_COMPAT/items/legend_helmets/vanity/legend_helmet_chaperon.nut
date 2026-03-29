::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_chaperon", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1200;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Deal [color=" + this.Const.UI.Color.PositiveValue + "]+4%[/color] damage."
		});
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.NegativeValue + "]20%[/color] more likely to attack you."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Deal [color=" + this.Const.UI.Color.PositiveValue + "]+4%[/color] damage."
		});
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies are [color=" + this.Const.UI.Color.NegativeValue + "]20%[/color] more likely to attack you."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.TargetAttractionMult *= 1.20;
		_properties.DamageTotalMult *= 1.04;
	}

});

