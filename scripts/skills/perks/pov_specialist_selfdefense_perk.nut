this.pov_specialist_selfdefense_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {},
	function create()
	{
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistSelfdefense);
		this.m.IconMini = "pov_perk_spec_staff_mini";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties ){
		local item = this.getContainer().getActor().getMainhandItem();
		local bonus = 16;
		if (item == null)
			return;
		if (item.isWeaponType(this.Const.Items.WeaponType.Staff) && item.isWeaponType(this.Const.Items.WeaponType.Sling))
			bonus = 8;
		else if (item.isWeaponType(this.Const.Items.WeaponType.Musical))
			bonus = 8;
		if (item.isWeaponType(this.Const.Items.WeaponType.Staff) || item.isWeaponType(this.Const.Items.WeaponType.MagicStaff) || item.isWeaponType(this.Const.Items.WeaponType.Musical)) {
			_properties.MeleeDefense  += bonus;
			_properties.RangedDefense += bonus;
			_properties.MeleeSkill += bonus;
		}
	}
});
