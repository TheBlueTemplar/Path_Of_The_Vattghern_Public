::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_bodyguard", function ( q ) {

	q.m.BonusMelee = 12;
	q.m.BonusDamage = 10;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_2hsword_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_2hsword.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_2hsword_bw.png";
	}

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			if (_properties.IsRiposting)
			{
				_properties.DamageTotalMult *= 1.0 + 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
			}

			if (_skill.isAOE() && _skill.isAttack() && !_skill.isRanged())
			{
				_properties.DamageTotalMult *= 1 + 0.01 * this.calculateSpecialistBonus(10, _skill.getItem());
			}
		}
	}
});