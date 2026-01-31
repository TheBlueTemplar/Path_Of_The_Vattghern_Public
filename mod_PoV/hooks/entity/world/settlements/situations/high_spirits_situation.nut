::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/high_spirits_situation", function(q) 
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
				icon = "ui/icons/pov_situation_bag.png",
				text = "Available Items for sale increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]"
			});
		}	
		return ret;
	}
});