::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_prisoner", function ( q ) {

	q.m.BonusMelee = 10;
	q.m.BonusDamage = 10;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_dagger_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_dagger.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_dagger_bw.png";
	}

	q.onUpdate = @(__original) function(_properties)
	{
		__original(_properties);
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

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageDirectMult += 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
	}

});