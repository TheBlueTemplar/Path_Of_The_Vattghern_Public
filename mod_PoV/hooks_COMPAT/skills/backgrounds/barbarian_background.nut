::TLW.HooksMod.hook("scripts/skills/backgrounds/barbarian_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_skill.png",
				text = "Melee and Ranged skill increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_defense.png",
				text = "Melee and Ranged defense reduced by [color=" + this.Const.UI.Color.NegativeValue + "]5%[/color]."
			}
		);
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/pov_rain.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Immunity[/color] To harsh weather debuffs."
		});
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.IsAffectedByRain = false;
		_properties.MeleeSkillMult *= 1.05;
		_properties.RangedSkillMult *= 1.05;
		_properties.MeleeDefenseMult *= 0.95;
		_properties.RangedDefenseMult *= 0.95;
	}
})
