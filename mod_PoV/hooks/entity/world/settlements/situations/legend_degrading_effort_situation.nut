::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/legend_degrading_effort_situation", function(q) 
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_wood.png",
				text = "Building Materials Value increased by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_wood.png",
				text = "Available Building Materials reduced by [color=" + this.Const.UI.Color.NegativeValue + "]45%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "After some time, the settlement\'s level will be reduced"
			});
		}
		return ret;
	}
});