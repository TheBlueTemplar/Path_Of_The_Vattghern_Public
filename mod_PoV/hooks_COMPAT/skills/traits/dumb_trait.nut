::TLW.HooksMod.hook("scripts/skills/traits/dumb_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Cannot read books, and cannot learn to read them either, unless this trait is removed somehow. (Overrides other effects that might allow reading)"
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/armor_head.png",
				text = "Takes [color=" + this.Const.UI.Color.PositiveValue+ "]15%[/color] less damage to the head. It\'s useless anyways."
			}
		);
		return ret;
	}

	q.onBeforeDamageReceived <- function( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart == ::Const.BodyPart.Head)
		{
			_properties.DamageReceivedRegularMult *= 0.85;
		}
	}
})
