::TLW.HooksMod.hook("scripts/skills/backgrounds/minstrel_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]20% more likely[/color] to be targeted by an enemy."
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_luck.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]4%[/color] chance to have any attacker require two successful attack rolls in order to hit."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.TargetAttractionMult *= 1.2;
		_properties.RerollDefenseChance += 4;
	}
})
