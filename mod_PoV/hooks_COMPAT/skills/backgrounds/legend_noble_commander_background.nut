::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_noble_commander_background", function(q)
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
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Can read books, with +1 to the max limit."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Increases Damage % by [color=" + this.Const.UI.Color.PositiveValue + "]7%[/color] of current resolve."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		local bonus = _properties.Bravery * 0.07;
		local damageBonus = 1.00 + (this.Math.maxf(1,bonus) / 100); 
		_properties.DamageTotalMult *= damageBonus;
	}
})
