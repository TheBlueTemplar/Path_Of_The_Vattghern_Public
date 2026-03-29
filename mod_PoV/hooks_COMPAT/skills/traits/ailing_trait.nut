::TLW.HooksMod.hook("scripts/skills/traits/ailing_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-7%[/color] hitpoints"
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.HitpointsMult *= 0.93;
	}
})
