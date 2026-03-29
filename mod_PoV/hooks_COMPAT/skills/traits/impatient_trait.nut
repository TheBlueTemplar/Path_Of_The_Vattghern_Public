::TLW.HooksMod.hook("scripts/skills/traits/impatient_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=%negative%]-5%[/color] Ranged Defense"
		});
		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "[color=%positive%]+5%[/color] Initiative"
		});
		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.RangedDefenseMult *= 0.95;
		_properties.InitiativeMult *= 1.05;
	}
})
