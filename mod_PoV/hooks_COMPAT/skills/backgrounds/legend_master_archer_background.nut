::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_master_archer_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Ranged attack damage increased by [color=" + this.Const.UI.Color.PositiveValue + "]6%[/color]."
			}
		);
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

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		local item = _skill.getItem();
		if (item != null)
		{
			if (_skill.isAttack() && item.isItemType(this.Const.Items.ItemType.Weapon) && _skill.isRanged())
			{
				_properties.DamageTotalMult *= 1.06;			
			}
		}	
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
