this.pov_specialist_sharpshooter_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = { // ignore for now, dont use
		SpecialistWeaponIds = [
			"weapon.war_bow",
			"weapon.named_warbow"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Bow
		],
		ExcludedItemTypes = [],
		BonusRanged = 12,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistSharpshooter);
		this.m.IconMini = "pov_perk_spec_longbow_mini";
	}
});
