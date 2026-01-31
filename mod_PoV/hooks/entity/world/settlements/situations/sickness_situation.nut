::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/sickness_situation", function(q) 
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
				icon = "ui/icons/pov_situation_medicine.png",
				text = "Medicine Value increased by [color=" + this.Const.UI.Color.NegativeValue + "]200%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits reduced by [color=" + this.Const.UI.Color.NegativeValue + "]75%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Cripples, Beggars, Monks, Herbalists[/color]"
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