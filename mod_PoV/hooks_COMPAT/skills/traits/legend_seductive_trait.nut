::TLW.HooksMod.hook("scripts/skills/traits/legend_seductive_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Enemies are [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] less likely to attack you."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function(_properties)
	{
		__original(_properties);
		_properties.TargetAttractionMult *= 0.90;
	}

})
