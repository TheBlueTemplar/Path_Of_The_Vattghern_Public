::TLW.HooksMod.hook("scripts/skills/backgrounds/cultist_background", function(q)
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
				icon = "ui/icons/bravery.png",
				text = "Increased [color=" + this.Const.UI.Color.PositiveValue + "]resistance[/color] to morale changes."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.MeleeSkillMult *= 1.05;
		_properties.RangedSkillMult *= 1.05;
		_properties.MoraleEffectMult *= 0.80;
	}
})
