::TLW.HooksMod.hook("scripts/skills/backgrounds/anatomist_background", function(q)
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
				text = "Damage done against mutants increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]."
			}
		);
		return ret;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null)
		{
			if(_targetEntity.getFlags().has("mutant"))
			{
				_properties.DamageTotalMult *= 1.05;
			}
		}	
	}
})
