::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/terrifying_nightmares_situation", function(q) 
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
				text = "Available Recruits reduced by [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Witch Hunters, Beast Hunters[/color]"
			});
			if (this.World.Assets.getOrigin().getID() == "scenario.militia")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Militia Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Night\'s Watchmen, Men at Arms[/color]"
				});
			}
		}	
		return ret;
	}

});