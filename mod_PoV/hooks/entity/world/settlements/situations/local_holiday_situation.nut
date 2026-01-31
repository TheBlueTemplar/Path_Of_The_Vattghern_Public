::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/local_holiday_situation", function(q) 
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Buying Prices reduced by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Selling Prices increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Food Value decreased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Available Food increased by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]"
			});
		}	
		return ret;
	}
});