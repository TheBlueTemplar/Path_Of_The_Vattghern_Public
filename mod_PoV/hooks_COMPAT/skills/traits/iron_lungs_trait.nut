::TLW.HooksMod.hook("scripts/skills/traits/iron_lungs_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Only take [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] of damage inflicted by harmful miasmas"
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.IsResistantToMiasma = true;
	}
})
