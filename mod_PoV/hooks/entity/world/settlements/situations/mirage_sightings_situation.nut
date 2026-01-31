::TLW.HooksMod.hook("scripts/entity/world/settlements/situations/mirage_sightings_situation", function(q) 
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
				text = "Rare chance for the following background to appear: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Illusionist[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Settlement\'s economy slightly reduced, will increase back up when this situation is resolved"
			});
		}	
		return ret;
	}

});