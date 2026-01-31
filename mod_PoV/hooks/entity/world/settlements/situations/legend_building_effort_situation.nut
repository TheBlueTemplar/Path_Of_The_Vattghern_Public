::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/legend_building_effort_situation", function(q) 
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
				text = "Available Building Materials reduced by [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color]"
			});
			if (this.m.IsSouthern)
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Daytelers, Slaves[/color]"
				});
			}
			else
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Lumberjacks, Masons, Daytelers, Inventors[/color]"
				});
			}
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "After some time, a new settlement location will be constructed on the map"
			});
		}
		return ret;
	}
});