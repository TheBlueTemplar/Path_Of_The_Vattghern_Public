::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/preparing_feast_situation", function(q) 
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
				text = "Food Value increased by [color=" + this.Const.UI.Color.NegativeValue + "]100%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Food Availability reduced by [color=" + this.Const.UI.Color.NegativeValue + "]75%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Servants, Eunuchs[/color]"
			});
		}	
		return ret;
	}

});