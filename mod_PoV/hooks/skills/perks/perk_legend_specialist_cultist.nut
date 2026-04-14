::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_cultist", function ( q ) {

	q.m.SpecialistWeaponIds.extend(["weapon.wooden_flail",]);
	q.m.BonusMelee = 10;
	q.m.BonusDamage = 12;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_cultist_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_cultist.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_cultist_bw.png";
	}

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			_properties.HitChance[this.Const.BodyPart.Head] += this.calculateSpecialistBonus(10, _skill.getItem());
			_properties.DamageArmorMult += 0.01 * this.calculateSpecialistBonus(10, _skill.getItem());
			_properties.DamageDirectMult += 0.01 * this.calculateSpecialistBonus(5, _skill.getItem());
		}
	}

});