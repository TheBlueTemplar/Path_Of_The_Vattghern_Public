::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_noble_ranged", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Fatigue cost of ranged attacks reduced by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		local actor = this.getContainer().getActor();
		if (actor != null)
		{			
			local skills = actor.getSkills().getAllSkillsOfType(this.Const.SkillType.Active);
			foreach (skill in skills)
			{
				if (skill.isAttack() && skill.isRanged())
				{
					skill.m.FatigueCost *= 0.90;
				}
			}
		} 
	}
})
