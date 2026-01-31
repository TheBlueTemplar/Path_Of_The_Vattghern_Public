::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/collectors_situation", function(q) 
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_beast.png",
				text = "Beast Parts Value increased by [color=" + this.Const.UI.Color.NegativeValue + "]100%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Witch Hunters, Beast Hunters, Anatomists[/color]"
			});
		}	
		return ret;
	}

});