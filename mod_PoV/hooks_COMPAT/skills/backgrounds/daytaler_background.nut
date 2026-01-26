::TLW.HooksMod.hook("scripts/skills/backgrounds/daytaler_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Max Fatigue increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.StaminaMult *= 1.05;
	}
})
