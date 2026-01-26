::TLW.HooksMod.hook("scripts/skills/backgrounds/butcher_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 19,
				type = "text",
				icon = "ui/icons/asset_food.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]-30%[/color] Food Consumption"
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.DailyFood *= 0.7;
	}
})
