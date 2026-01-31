::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/cultist_procession_situation", function(q) 
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
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Cultists, Flagellants, Butchers[/color]"
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
		}	
		return ret;
	}

});