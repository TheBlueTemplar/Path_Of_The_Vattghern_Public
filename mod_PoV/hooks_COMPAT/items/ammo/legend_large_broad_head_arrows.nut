::TLW.HooksMod.hook("scripts/items/ammo/legend_large_broad_head_arrows", function (q) {
	
	q.create = @(__original) function()
	{
		__original();
		this.m.Description = "A large quiver of arrows with broad tips, designed for tearing flesh, but easily stopped by armor. Is automatically refilled after each battle if you have enough global ammunition. Grants [color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] damage and [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] armor damage, but [color=" + this.Const.UI.Color.NegativeValue + "]half[/color] armor penetration while wielding a bow."
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		local item = _skill.getItem();
		if (_skill.isAttack() && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Bow))
		{
			_properties.DamageDirectMult *= 0.50;
			_properties.RangedDamageMult *= 1.15;
			_properties.DamageArmorMult *= 1.20;
		}
	}

});

