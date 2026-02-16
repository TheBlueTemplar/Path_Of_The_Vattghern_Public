this.pov_named_rough_staff <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.ID = "weapon.pov_named_rough_staff";
		this.m.NameList = this.Const.Strings.PovStaffNames;
		this.m.Description = "An excellently made seer staff. Filled with power, its orb has almost burst, overloaded with energy .It provides a great catalyst for spellcasting.";
		this.m.IconLarge = "weapons/melee/pov_named_rough_staff.png";
		this.m.Icon = "weapons/melee/pov_named_rough_staff_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Polearm | this.Const.Items.WeaponType.Staff | this.Const.Items.WeaponType.MagicStaff;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "pov_icon_named_rough_staff";
		this.m.Value = 3750;
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
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.named_weapon.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Skills used with this staff do [color=" + this.Const.UI.Color.PositiveValue + "]15%[/color] more damage and cost [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] less fatigue."
		});
		return result;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties)
	{
		if (_skill != null)
		{
			if (_skill.isAttack())
			{
				_properties.DamageTotalMult *= 1.15;
			}
		}
	}

	function onUpdateProperties(_properties)
	{
		this.named_weapon.onUpdateProperties(_properties);
		local actor = this.getContainer().getActor();
		if (actor != null)
		{			
			local skills = actor.getSkills().getAllSkillsOfType(this.Const.SkillType.Active);
			foreach (skill in skills)
			{
				skill.m.FatigueCost *= 0.90;
			}
		} 
	}

	function onEquip()
	{
		this.named_weapon.onEquip();

		local bash = this.new("scripts/skills/actives/bash");
		bash.m.Icon = "skills/pov_active_named_rough_staff_bash.png";
		bash.m.IconDisabled = "skills/pov_active_named_rough_staff_bash_sw.png";
		bash.m.Overlay = "skills/pov_active_named_rough_staff_bash";
		bash.m.IsStaffBash = true;
		this.addSkill(bash);

		local knockOut = this.new("scripts/skills/actives/knock_out");
		knockOut.m.Icon = "skills/pov_active_named_rough_staff_knock_out.png";
		knockOut.m.IconDisabled = "skills/pov_active_named_rough_staff_knock_out_sw.png";
		knockOut.m.Overlay = "skills/pov_active_named_rough_staff_knock_out";
		knockOut.m.IsStaffKnockOut = true;
		this.addSkill(knockOut);

		::Legends.Actives.grant(this, ::Legends.Active.LegendStaffRiposte);
	}

});

