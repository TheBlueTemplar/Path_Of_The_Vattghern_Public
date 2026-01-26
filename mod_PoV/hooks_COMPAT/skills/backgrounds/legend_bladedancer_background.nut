::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_bladedancer_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done using swords increased by [color=" + this.Const.UI.Color.PositiveValue + "]4[/color]."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Fatigue cost of using swords reduced by [color=" + this.Const.UI.Color.PositiveValue + "]8%[/color]."
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
				_properties.DamageRegularMin += 4;
				_properties.DamageRegularMax += 4;		
			}
		}	
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		local actor = this.getContainer().getActor();
		local item = actor.getMainhandItem();
		if (actor != null && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Sword))
		{			
			local skills = actor.getSkills().getAllSkillsOfType(this.Const.SkillType.Active);
			foreach (skill in skills)
			{
				if (skill.isAttack() && skill.isRanged())
				{
					skill.m.FatigueCost *= 0.88;
				}
			}
		} 
	}
})
