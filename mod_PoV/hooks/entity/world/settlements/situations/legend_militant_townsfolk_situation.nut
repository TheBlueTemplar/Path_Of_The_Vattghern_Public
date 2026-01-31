::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/legend_militant_townsfolk_situation", function(q) 
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Food Items Availability reduced by [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_wood.png",
				text = "Available Building Materials reduced by [color=" + this.Const.UI.Color.NegativeValue + "]75%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_mineral.png",
				text = "Available Minerals reduced by [color=" + this.Const.UI.Color.NegativeValue + "]75%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.PositiveValue + "]400%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Farmhands, Millers, Butchers, Shepherds, Tailors, Apprentices[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Several civilian weapons added to the marketplace"
			});
		}	
		return ret;
	}
});