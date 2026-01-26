this.pov_rough_staff <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.pov_rough_staff";
		this.m.Name = "Rough Staff";
		this.m.Description = "A roughly made staff, from a person far detached from civilized life. A powerful green orb is embedded at its tip. A required instrument for spellcasting.";
		this.m.IconLarge = "weapons/melee/pov_rough_staff.png";
		this.m.Icon = "weapons/melee/pov_rough_staff_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Polearm | this.Const.Items.WeaponType.Staff | this.Const.Items.WeaponType.MagicStaff;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "pov_icon_rough_staff";
		this.m.Value = 750;
		this.m.ShieldDamage = 0;
		this.m.Condition = 85.0;
		this.m.ConditionMax = 85.0;
		this.m.StaminaModifier = -4;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.8;
		this.m.DirectDamageMult = 0.25;
		//this.m.DirectDamageAdd = -0.05;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		
		local bash = this.new("scripts/skills/actives/bash");
		bash.m.Icon = "skills/pov_active_rough_staff_bash.png";
		bash.m.IconDisabled = "skills/pov_active_rough_staff_bash_sw.png";
		bash.m.Overlay = "skills/pov_active_rough_staff_bash";
		bash.m.IsStaffBash = true;
		this.addSkill(bash);

		local knockOut = this.new("scripts/skills/actives/knock_out");
		knockOut.m.Icon = "skills/pov_active_rough_staff_knock_out.png";
		knockOut.m.IconDisabled = "skills/pov_active_rough_staff_knock_out_sw.png";
		knockOut.m.Overlay = "skills/pov_active_rough_staff_knock_out";
		knockOut.m.IsStaffKnockOut = true;
		this.addSkill(knockOut);

		::Legends.Actives.grant(this, ::Legends.Active.LegendStaffRiposte);
	}

});

