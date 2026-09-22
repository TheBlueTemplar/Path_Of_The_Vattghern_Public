::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_inventor", function (q) {

	q.m.SpecialistWeaponTypes = [];
	q.m.SpecialistWeaponIds.extend([
		"weapon.handgonne",
		"weapon.named_handgonne",
		"weapon.firelance",
	]);
	q.m.ApplicableWeaponTypes = [::Const.Items.WeaponType.Firearm];

	q.m.BonusMelee = 10;
	q.m.BonusRanged = 10;
	q.m.BonusDamage = 14;

	q.create = @(__original) function () {
		__original();

		this.m.IconMini = "pov_perk_spec_firearm_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_firearm.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_firearm_bw.png";
	}
});
