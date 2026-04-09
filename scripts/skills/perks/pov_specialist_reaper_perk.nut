this.pov_specialist_reaper_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.legend_grisly_scythe",
			"weapon.legend_scythe",
			"weapon.warscythe",
			"weapon.named_warscythe"
		],
		BonusMelee = 15,
		BonusDamage = 15
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistReaper);
		this.m.IconMini = "pov_perk_spec_scythe_mini";
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			_properties.DamageArmorMult += 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
			_properties.DamageDirectMult += 0.01 * this.calculateSpecialistBonus(10, _skill.getItem());
		}
	}

	function onUpdate(_properties)
	{
		this.pov_specialist_abstract.onUpdate(_properties);
		_properties.Threat += 4;
	}

});
