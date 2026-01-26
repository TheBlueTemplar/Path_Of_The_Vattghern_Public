::TLW.HooksMod.hook("scripts/items/accessory/goblin_trophy_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 2500; // up from 500
	}	

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
				id = 13,
				type = "text",
				icon = "ui/icons/pov_poison.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]immunity[/color] to poison."
			});
		ret.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Reduces any ranged damage taken by [color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color]"
			});
		return ret;
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.IsImmuneToPoison = true;
		_properties.DamageReceivedRangedMult *= 0.85;
	}

});

