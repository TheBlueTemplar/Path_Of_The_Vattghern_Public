::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/arena_tournament_situation", function(q) 
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
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Gladiators[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Able to participate in a special Arena Tournament"
			});
		}
		return ret;
	}
});