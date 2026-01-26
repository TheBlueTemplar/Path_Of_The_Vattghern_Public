::TLW.HooksMod.hook("scripts/skills/backgrounds/eunuch_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/days_wounded.png",
				text = "Injury threshold increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.ThresholdToReceiveInjuryMult *= 1.10;
	}
})
