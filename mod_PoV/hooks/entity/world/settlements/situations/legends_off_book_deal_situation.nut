::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/legends_off_book_deal_situation", function(q) 
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_bag.png",
				text = "Available Items for sale increased by [color=" + this.Const.UI.Color.NegativeValue + "]"+ (100 * this.m.Stacks) * this.m.BuyPriceMultPerStack+"%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Buying Prices increased by [color=" + this.Const.UI.Color.PositiveValue + "]"+ (100 * this.m.Stacks) * this.m.BuyPriceMultPerStack+"%[/color]"
			});
		}	
		return ret;
	}

});