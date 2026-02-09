this.pov_named_goblin_spiked_balls <- inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function isAmountShown()
	{
		return true;
	}

	function getAmountString()
	{
		return this.m.Ammo + "/" + this.m.AmmoMax;
	}

	function create()
	{
		this.named_weapon.create();
		this.m.ID = "weapon.pov_named_goblin_spiked_balls";
		this.m.Variants = [1,2];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		//this.m.PrefixList = [""];
		//this.m.SuffixList = [""];
		this.m.NameList = this.Const.Strings.PovGoblinBallsNames;
		this.m.Description = "These weapons, while inspired by their greenskin counterparts, seem far too refined for their kind. Designed and decorated with high quality material and attention to detail, they can easily disrupt and slow down their enemies, while delivering quite the headache.";
		this.m.Categories = "Throwing Weapon, One-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.WeaponType = this.Const.Items.WeaponType.Throwing;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.OneHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 1000;
		this.m.Ammo = 8;
		this.m.AmmoMax = 8;
		this.m.RangeMin = 2;
		this.m.RangeMax = 4;
		this.m.RangeIdeal = 4;
		this.m.StaminaModifier = -5;
		this.m.RegularDamage = 20;
		this.m.RegularDamageMax = 35;
		this.m.ArmorDamageMult = 1.15;
		this.m.DirectDamageMult = 0.4;
		this.m.IsDroppedAsLoot = true;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.named_weapon.getTooltip();
		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "Attacks [color=" + this.Const.UI.Color.PositiveValue + "]Ignore[/color] the defense bonus granted by shields."
		});
		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Ranged hits with this weapon [color=" + this.Const.UI.Color.PositiveValue + "]reduce[/color] the target\'s initiative."
		});
		return result;
	}

	function updateVariant()
	{	
		//I have this weird ass issue, where whatever I do, I get fucked and have to use the same sprite twice
		if (this.m.Ammo > 0) 
		{
			this.m.IconLarge = "weapons/ranged/pov_named_spiked_balls_0" + this.m.Variant + ".png";
			this.m.Icon = "weapons/ranged/pov_named_spiked_balls_70x70_0" + this.m.Variant + ".png";
			this.m.ArmamentIcon = "pov_icon_named_spiked_balls_0" + this.m.Variant;
			this.m.ShowArmamentIcon = true;
		}
		else
		{
			this.m.IconLarge = "weapons/ranged/pov_named_spiked_balls_0" + this.m.Variant + ".png";
			this.m.Icon = "weapons/ranged/pov_named_spiked_balls_70x70_0" + this.m.Variant + ".png";
			this.m.ArmamentIcon = "pov_icon_named_spiked_balls_0" + this.m.Variant;
			//this.m.IconLarge = "weapons/ranged/throwing_axes_01_bag.png";
			//this.m.Icon = "weapons/ranged/throwing_axes_01_bag_70x70.png";
			//this.m.ArmamentIcon = "icon_goblin_weapon_07_" + this.m.Variant;
			this.m.ShowArmamentIcon = false;
		}
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
		if ( _skill == null || _skill.m.IsWeaponSkill == false )
			return;

		if (!_target.isAlive() || _target.isDying())
			return;

		if (_skill.isRanged())
		{
			local bola = this.new("scripts/skills/effects/pov_bola_effect");
			_target.getSkills().add(bola);
		}	
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/throw_balls"));
		if (!::TLW.hasFOTN)
		{
			local flail = this.new("scripts/skills/actives/flail_skill");
			flail.m.IsThrowingWeapon = true;
			flail.m.ActionPointCost = 3;
			this.addSkill(flail);
		}
	}

	function setAmmo(_a)
	{
		this.weapon.setAmmo(_a);
		this.updateVariant();
		this.updateAppearance();
	}

})
