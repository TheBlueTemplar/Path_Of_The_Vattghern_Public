this.pov_specialist_inquisition_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.legend_wooden_stake",
			"weapon.legend_hand_crossbow",
			"weapon.goblin_crossbow"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Crossbow
		],
		ValidEntities = [
			this.Const.EntityType.Hexe,
			this.Const.EntityType.Alp
		],
		BonusMelee = 10,
		BonusRanged = 8,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistInquisition);
		this.m.IconMini = "pov_perk_spec_xbow_mini";
	}

	function onUpdate(_properties)
	{
		this.pov_specialist_abstract.onUpdate(_properties);
		_properties.MoraleCheckBravery[1] += 5;
	}
});
