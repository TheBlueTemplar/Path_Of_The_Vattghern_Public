this.pov_specialist_cultist_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.legend_cat_o_nine_tails",
			"weapon.wooden_flail"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Flail,
			this.Const.Items.WeaponType.Whip
		],
		BonusMelee = 10,
		BonusDamage = 12
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistCultist);
		this.m.IconMini = "pov_perk_spec_cultist_mini";
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			_properties.HitChance[this.Const.BodyPart.Head] += this.calculateSpecialistBonus(10, _skill.getItem());
			_properties.DamageArmorMult += 0.01 * this.calculateSpecialistBonus(10, _skill.getItem());
			_properties.DamageDirectMult += 0.01 * this.calculateSpecialistBonus(5, _skill.getItem());
		}
	}
});
