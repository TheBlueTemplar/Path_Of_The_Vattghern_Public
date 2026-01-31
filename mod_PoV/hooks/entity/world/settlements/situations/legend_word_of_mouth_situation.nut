::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/legend_word_of_mouth_situation", function(q) 
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Buying Prices reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]"
			});
		}	
		return ret;
	}
});