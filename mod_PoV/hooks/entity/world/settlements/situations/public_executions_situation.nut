::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/public_executions_situation", function(q) 
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
				text = "Food Value increased by [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Food Availability increased by [color=" + this.Const.UI.Color.PositiveValue + "]35%[/color]"
			});
		}	
		return ret;
	}

});