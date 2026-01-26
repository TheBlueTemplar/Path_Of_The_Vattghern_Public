::TLW.HooksMod.hook("scripts/skills/backgrounds/thief_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]15% less likely[/color] to be targeted by an enemy."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_defense.png",
				text = "While hidden, Melee and Ranged defense increased by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		local actor = this.getContainer().getActor();
		_properties.TargetAttractionMult *= 0.85;

		if (actor != null)
		{
			if (actor.getSkills().hasSkill("terrain.hidden"))
			{
				_properties.MeleeDefense += 10;
				_properties.RangedDefense += 10;
			}
		}
	}
})
