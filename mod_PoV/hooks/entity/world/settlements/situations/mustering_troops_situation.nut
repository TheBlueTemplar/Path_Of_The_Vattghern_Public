::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/mustering_troops_situation", function(q) 
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
				text = "Available Items for sale reduced by [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits reduced by [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Retired Soldiers, Cripples, Deserters[/color]"
			});
			if (this.World.Assets.getOrigin().getID() == "scenario.militia")
			{
				ret.push({
					id = 8,
					type = "text",
					icon = "ui/icons/pov_situation_person.png",
					text = "Additional Possible Recruits (Militia Scenario): [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Men at Arms[/color]"
				});
			}
		}	
		return ret;
	}

});