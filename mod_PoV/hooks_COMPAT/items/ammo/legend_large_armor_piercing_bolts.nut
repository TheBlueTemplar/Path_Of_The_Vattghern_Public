::TLW.HooksMod.hook("scripts/items/ammo/legend_large_armor_piercing_bolts", function (q) {
	
	q.create = @(__original) function()
	{
		__original();
		this.m.Description = "A large quiver of bolts with piercing tips, designed for punching through thick armor and injuring the wearer, but without substantially damaging the armor itself. Is automatically refilled after each battle if you have enough ammunition. Grants [color=" + this.Const.UI.Color.PositiveValue + "]+65%[/color] armor penetration and [color=" + this.Const.UI.Color.PositiveValue + "]+33%[/color] more likely to injure an enemy, but [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] damage and [color=" + this.Const.UI.Color.NegativeValue + "]-20%[/color] armor effectiveness while wielding a crossbow."
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		local item = _skill.getItem();
		if (_skill.isAttack() && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Crossbow))
		{
			_properties.DamageDirectMult *= 1.65;
			_properties.RangedDamageMult *= 0.90;
			_properties.DamageArmorMult *= 0.80;
		}
	}

	q.onBeforeTargetHit <- function ( _skill, _targetEntity, _hitInfo )
	{
		local item = _skill.getItem();
		if (_skill.isAttack() && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Crossbow))
		{
			_hitInfo.InjuryThresholdMult *= 0.66;
		}
	}

});

