::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/seasonal_fair_situation", function(q) 
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
				text = "Buying Prices increased by [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Selling Prices increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_bag.png",
				text = "Available Items for sale increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_food.png",
				text = "Food Availability increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_medicine.png",
				text = "Medicine Availability increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			});
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
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Peddlers, Jugglers, Minstrels, Master Archers[/color]"
			});
			if (this.World.Assets.getOrigin().getID() == "scenario.legends_troupe")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Troupe Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Illusionist[/color]"
				});
			}
			if (this.World.Assets.getOrigin().getID() == "scenario.militia")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Militia Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Leech Peddlers[/color]"
				});
			}
		}	
		return ret;
	}

});