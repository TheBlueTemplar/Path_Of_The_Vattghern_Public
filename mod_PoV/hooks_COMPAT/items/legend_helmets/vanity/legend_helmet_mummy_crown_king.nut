::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_mummy_crown_king", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 960;
	}

	q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] resolve."
		});
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Take [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color] less damage from undead."
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
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Take [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color] less damage from undead."
		});
	}

	q.onUpdateProperties = @(__original) function ( _properties )
	{
		__original(_properties);
		_properties.Bravery += 2;
	}

	q.onBeforeDamageReceived = @(__original) function ( _attacker, _skill, _hitInfo, _properties )
	{
		__original(_attacker, _skill, _hitInfo, _properties)
		if (_attacker != null && _skill != null)
		{
			if (this.Const.EntityType.getDefaultFaction(_attacker.getType()) == this.Const.FactionType.Undead || this.Const.EntityType.getDefaultFaction(_attacker.getType()) == this.Const.FactionType.Zombies || _attacker.getFlags().has("undead"))
			{
				_properties.DamageReceivedTotalMult *= 0.95;
			}
		}
	}

});

