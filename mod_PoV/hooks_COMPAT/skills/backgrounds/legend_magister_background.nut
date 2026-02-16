::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_magister_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Resolve increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Increased [color=" + this.Const.UI.Color.PositiveValue + "]resistance[/color] to morale changes."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.BraveryMult *= 1.10;
		_properties.MoraleEffectMult *= 0.75;
	}
})
