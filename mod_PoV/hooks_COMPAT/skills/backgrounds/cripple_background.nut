::TLW.HooksMod.hook("scripts/skills/backgrounds/cripple_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]30% less likely[/color] to be targeted by an enemy."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.TargetAttractionMult *= 0.7;
	}
})
