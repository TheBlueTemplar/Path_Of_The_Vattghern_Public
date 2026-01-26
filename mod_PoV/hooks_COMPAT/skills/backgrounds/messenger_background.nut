::TLW.HooksMod.hook("scripts/skills/backgrounds/messenger_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Movement costs [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] less Fatigue."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.MovementFatigueCostMult *= 0.8;
	}
})
