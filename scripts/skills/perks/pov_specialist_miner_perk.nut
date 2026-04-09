this.pov_specialist_miner_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.pickaxe",
			"weapon.military_pick"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Hammer
		],
		ApplicableItemTypes = [
			this.Const.Items.ItemType.TwoHanded
		],
		ValidEntities = [
			this.Const.EntityType.LegendRockUnhold,
			this.Const.EntityType.SandGolem
		],
		BonusMelee = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistMiner);
		this.m.IconMini = "pov_perk_spec_pickaxe_mini";
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageMinimum += 0.01 * this.calculateSpecialistBonus(10, _skill.getItem());
	}
});
