::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_gravedigger", function ( q ) {

	q.m.BonusMelee = 12;
	q.m.BonusDamage = 12;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_shovel_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_shovel.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_shovel_bw.png";
	}

});