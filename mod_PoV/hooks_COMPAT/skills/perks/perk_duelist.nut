::TLW.HooksMod.hook("scripts/skills/perks/perk_duelist", function ( q ) {

	q.m.AllowedWeapons.extend([
		"shield.pov_steel_buckler",
		"shield.pov_named_steel_buckler"
	]);

});