::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/archery_contest_situation", function(q) 
{
	if(::TLW.PovSituation)
	{
		q.getTooltip = @(__original) function()
		{
			local ret = __original();
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Hunters, Poachers, Witch Hunters, Sellswords, Master Archers[/color]"
			});
			return ret;
		}
	}	
});