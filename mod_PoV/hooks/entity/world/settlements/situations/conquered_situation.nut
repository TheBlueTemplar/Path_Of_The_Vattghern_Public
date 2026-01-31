::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/conquered_situation", function(q) 
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Buying Prices increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Selling Prices reduced by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_bag.png",
				text = "Available Items for sale reduced by [color=" + this.Const.UI.Color.NegativeValue + "]40%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Food Availability reduced by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Refugees, Vagabonds, Gravediggers, Beggars[/color]"
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