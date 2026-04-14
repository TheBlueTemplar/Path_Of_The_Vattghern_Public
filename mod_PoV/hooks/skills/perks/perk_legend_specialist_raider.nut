::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_raider", function ( q ) {

	q.m.SpecialistWeaponIds.extend(["weapon.hatchet",]);
	q.m.BonusMelee = 10;
	q.m.BonusRanged = 10;
	q.m.BonusDamage = 10;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_raider_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_raider.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_raider_bw.png";
	}

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageAgainstMult[this.Const.BodyPart.Head] += 0.01 * this.calculateSpecialistBonus(15, _skill.getItem());
	}

});