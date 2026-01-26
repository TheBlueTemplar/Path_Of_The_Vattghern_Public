::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_ranger_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "Ranged Damage ignoring armor increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]."
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
				_properties.DamageTotalMult *= 1.05;		
			}
		}	
	}
})
