::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/lost_at_sea_situation", function(q) 
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
				text = "Food Value increased by [color=" + this.Const.UI.Color.NegativeValue + "]100%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Food Availability reduced by [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits reduced by [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color]"
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
		}	
		return ret;
	}

});