this.pov_specialist_woodsman_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.woodcutters_axe",
			"weapon.legend_saw"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Axe
		],
		ApplicableItemTypes = [
			this.Const.Items.ItemType.TwoHanded
		],
		ValidEntities = [
			this.Const.EntityType.Schrat,
			this.Const.EntityType.LegendGreenwoodSchrat,
			this.Const.EntityType.SchratSmall,
			this.Const.EntityType.LegendGreenwoodSchratSmall
		],
		BonusMelee = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistWoodsman);
		this.m.IconMini = "pov_perk_spec_woodsman_mini";
	}
});
