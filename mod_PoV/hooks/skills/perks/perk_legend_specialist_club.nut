::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_club", function ( q ) {

	q.m.BonusMelee = 10;
	q.m.BonusDamage = 14;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_mace_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_mace.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_mace_bw.png";
	}

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.FatigueDealtPerHitMult += 1.0;
	}

});