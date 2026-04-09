this.pov_specialist_prisoner_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.knife",
			"weapon.legend_shiv"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Dagger
		],
		BonusMelee = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistPrisoner);
		this.m.IconMini = "pov_perk_spec_dagger_mini";
	}

	function onUpdate(_properties)
	{
		local actor = this.getContainer().getActor();
		if (actor != null)
		{
			if (actor.getSkills().hasSkill("terrain.hidden"))
			{
				_properties.MeleeDefense += 5;
				_properties.RangedDefense += 5;
			}
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageDirectMult += 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
	}

});
