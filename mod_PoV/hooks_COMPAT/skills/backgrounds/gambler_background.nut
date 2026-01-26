::TLW.HooksMod.hook("scripts/skills/backgrounds/gambler_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/chance_to_hit_head.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] chance to hit the head"
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_luck.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+4%[/color] chance to have any attacker require two successful attack rolls in order to hit."
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_luck.png",
				text = "Chance to hit increased by[color=" + this.Const.UI.Color.PositiveValue + "]1%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.HitChance[this.Const.BodyPart.Head] += 2;
		_properties.RerollDefenseChance += 4;
		_properties.MeleeSkill += 1;
		_properties.RangedSkill += 1;
	}
})
