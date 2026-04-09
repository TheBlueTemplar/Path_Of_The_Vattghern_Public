this.pov_specialist_raider_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.crude_axe",
			"weapon.hatchet",
			"weapon.throwing_axe"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Axe
		],
		ApplicableItemTypes = [
			this.Const.Items.ItemType.OneHanded
		],
		BonusMelee = 10,
		BonusRanged = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistRaider);
		this.m.IconMini = "pov_perk_spec_raider_mini";
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageAgainstMult[this.Const.BodyPart.Head] += 0.01 * this.calculateSpecialistBonus(15, _skill.getItem());
	}
});
