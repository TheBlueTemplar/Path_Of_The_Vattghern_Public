::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_herbalist_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done using sickles increased by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color]."
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
			if (_skill.isAttack() && item.isItemType(this.Const.Items.ItemType.Weapon))
			{
				if (item.getID() == "weapon.sickle" || item.getID() == "weapon.goblin_notched_blade" || item.getID() == "weapon.legend_named_sickle")
				{	
					_properties.DamageRegularMin += 10;
					_properties.DamageRegularMax += 10;	
				}			
			}
		}	
	}
})
