this.pov_specialist_inventor_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponTypes = [
			this.Const.Items.WeaponType.Firearm
		],
		BonusMelee = 10,
		BonusRanged = 10,
		BonusDamage = 14
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistInventor);
		this.m.IconMini = "pov_perk_spec_firearm_mini";
	}
});
