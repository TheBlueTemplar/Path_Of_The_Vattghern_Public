::TLW.HooksMod.hook("scripts/skills/backgrounds/monk_turned_flagellant_background", function(q)
{
	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();

		if (!actor.getFlags().has("PovCanRead"))
		{
			actor.getFlags().add("PovCanRead");
		}

		if (!actor.getFlags().has("PovReadLimitEducated"))
		{
			actor.getFlags().add("PovReadLimitEducated");
		}
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "Reduced Damage Taken by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Can read books, with +1 to the max limit."
			}
		);
		return ret;
	}

	q.onBeforeDamageReceived = @(__original) function( _attacker, _skill, _hitInfo, _properties )
	{
		__original(_attacker, _skill, _hitInfo, _properties);
		_properties.DamageReceivedTotalMult *= 0.95;
	}
})
