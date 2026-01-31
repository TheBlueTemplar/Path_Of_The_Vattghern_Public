::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/mine_cavein_situation", function(q) 
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
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Miners, Ironmongers, Blacksmiths[/color]"
			});
			if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro" || this.World.Assets.getOrigin().getID() == "scenario.legends_solo_necro")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Necromancer Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Puppets[/color]"
				});
			}
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Copper and Gems won\'t be available for sale"
			});
		}	
		return ret;
	}

});