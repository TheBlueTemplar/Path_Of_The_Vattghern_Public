::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_fleshcultist_straps", function (q) {
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
			text = "Lose [color=" + this.Const.UI.Color.NegativeValue + "]- 4[/color] resolve."
		});
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Take [color=" + this.Const.UI.Color.NegativeValue + "]4%[/color] less damage."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Lose [color=" + this.Const.UI.Color.PositiveValue + "]-4[/color] resolve."
		});
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Take [color=" + this.Const.UI.Color.NegativeValue + "]4%[/color] less damage."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Bravery -= 4;
	}

	q.onBeforeDamageReceived = @(__original) function ( _attacker, _skill, _hitInfo, _properties )
	{
		__original(_attacker, _skill, _hitInfo, _properties)
		if (_attacker != null && _skill != null)
		{
			_properties.DamageReceivedTotalMult *= 0.96;
		}
	}

});

