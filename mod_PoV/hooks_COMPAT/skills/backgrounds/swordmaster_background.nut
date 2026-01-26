::TLW.HooksMod.hook("scripts/skills/backgrounds/swordmaster_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done using swords increased by [color=" + this.Const.UI.Color.PositiveValue + "]5[/color]."
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
			if (_skill.isAttack() && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Sword))
			{
				_properties.DamageRegularMin += 5;
				_properties.DamageRegularMax += 5;
				//_properties.FatigueEffectMult *= 0.90;			
			}
		}	
	}
})
