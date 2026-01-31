::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/legend_merc_company_disbands_situation", function(q) 
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
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Sellswords, Hedge Knights, Swordmasters, Master Archers, Retired Soldiers, Deserters, Militia[/color]"
			});
			if (this.World.Assets.getOrigin().getID() == "scenario.legends_noble")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Noble Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Warriors, Footmen, Arbalesters, Adventurous Nobles[/color]"
				});
			}
		}	
		return ret;
	}
});