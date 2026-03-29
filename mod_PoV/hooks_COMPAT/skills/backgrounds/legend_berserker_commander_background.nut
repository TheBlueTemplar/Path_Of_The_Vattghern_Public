::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_berserker_commander_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/scroll_01.png",
			text = "Cannot Read Books, and it would be a waste of time to try and change that."
		});
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/pov_rain.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Immunity[/color] To harsh weather debuffs."
		});
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		
		_properties.IsAffectedByRain = false;	
	}
})
