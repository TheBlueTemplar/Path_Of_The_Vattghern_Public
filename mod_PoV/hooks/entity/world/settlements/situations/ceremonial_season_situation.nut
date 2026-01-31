::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/ceremonial_season_situation", function(q) 
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
				text = "Incense Value increased by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Monks, Cultists, Flagellants[/color]"
			});
			if (this.World.Assets.getOrigin().getID() == "scenario.legends_cultists")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Cultists Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Husks, Lurkers, Magisters[/color]"
				});
			}
			if (this.World.Assets.getOrigin().getID() == "scenario.legends_crusader")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Crusader Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Pilgrims[/color]"
				});
			}
		}	
		return ret;
	}

});