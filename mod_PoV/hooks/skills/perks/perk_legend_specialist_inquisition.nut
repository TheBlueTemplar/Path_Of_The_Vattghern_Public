::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_inquisition", function ( q ) {

	q.m.BonusMelee = 10;
	q.m.BonusRanged = 8;
	q.m.BonusDamage = 10;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_xbow_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_xbow.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_xbow_bw.png";
	}

});