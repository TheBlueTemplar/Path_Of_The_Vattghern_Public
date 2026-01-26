this.pov_blunt_arrows <- this.inherit("scripts/items/ammo/ammo", {
	m = {},
	function create()
	{
		this.ammo.create();
		this.m.ID = "ammo.arrows";
		this.m.Name = "Blunt Arrows";
		this.m.Description = "A quiver of arrows whose tips are coated with silver, especially effective against beasts, mutants, and the supernatural, but weak against armor. Is automatically refilled after each battle if you have enough ammunition. \n\nGrants [color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] damage against beasts and undead, with [color=" + this.Const.UI.Color.PositiveValue + "]half[/color] of that bonus against mutants. Attacks also [color=" + this.Const.UI.Color.PositiveValue + "]injure[/color] these enemies easier. Does [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] damage to other enemies, and is [color=" + this.Const.UI.Color.NegativeValue + "]20%[/color] less effective against armor.";
		this.m.Icon = "ammo/pov_silver_arrows_quiver.png";
		this.m.IconEmpty = "ammo/quiver_01_empty.png";
		this.m.SlotType = this.Const.ItemSlot.Ammo;
		this.m.ItemType = this.Const.Items.ItemType.Ammo;
		this.m.AmmoType = this.Const.Items.AmmoType.Arrows;
		this.m.ShowOnCharacter = true;
		this.m.ShowQuiver = true;
		this.m.Sprite = "bust_quiver_01";
		this.m.Value = 4750;
		this.m.Ammo = 10;
		this.m.AmmoMax = 10;
		this.m.IsDroppedAsLoot = true;
		this.m.AddGenericSkill = true;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.m.Ammo != 0)
		{
			result.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "Contains [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Ammo + "[/color] arrows"
			});
		}
		else
		{
			result.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Is empty and useless[/color]"
			});
		}

		return result;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local item = _skill.getItem();
		if (item != null)
		{
			if (_skill.isAttack() && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Bow))
			{
				_properties.DamageArmorMult *= 1.50;
				_skill.m.InjuriesOnBody = ::Const.Injury.BluntBody;
				_skill.m.InjuriesOnHead = ::Const.Injury.BluntHead;
				// add a check for: Skeleton, Alp, Sandgolem, 
			}
		}
	}

	/*function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		local item = _skill.getItem();
		if (_skill.isAttack() && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Bow))
		{
			//_hitInfo.DamageType = this.Const.Damage.DamageType.Blunt;
			//_hitInfo.DamageType = ::Const.Damage.DamageType.Blunt;
			_skill.m.InjuriesOnBody = ::Const.Injury.BluntBody;
			_skill.m.InjuriesOnHead = ::Const.Injury.BluntHead;
		}
	}*/

});

