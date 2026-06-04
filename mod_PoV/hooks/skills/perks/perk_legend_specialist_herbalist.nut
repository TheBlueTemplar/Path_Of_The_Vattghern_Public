::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_herbalist", function (q) {

	q.m.BonusMelee = 10;
	q.m.BonusDamage = 12;

	q.create = @(__original) function () {
		__original();

		this.m.IconMini = "pov_perk_spec_sickle_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_sickle.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_sickle_bw.png";
	}

	q.onAdded = @(__original) function () {
		__original();
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if (::World.State.getPlayer() != null) {
			local actor = this.getContainer().getActor();
			if (actor.getFaction() == this.Const.Faction.Player) {
				if (actor.getBackground() != null) {
					actor.getBackground().m.Modifiers.Gathering += 0.05;
					//actor.getBackground().onAdded();
				}
			}
		}
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties) {
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill)
			&& _properties.ThresholdToInflictInjuryMult != 1.0) {
			_properties.DamageRegularMult *= 1.0 + 0.01 * this.calculateSpecialistBonus(25, _skill.getItem()) * (1.0 - _properties.ThresholdToInflictInjuryMult);
		}
	}
});
