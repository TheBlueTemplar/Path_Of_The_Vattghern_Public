::TLW.HooksMod.hook("scripts/skills/traits/dastard_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] Resolve at morale checks against fear, panic or mind control effects"
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.MoraleCheckBravery[1] -= 5;
	}
})
