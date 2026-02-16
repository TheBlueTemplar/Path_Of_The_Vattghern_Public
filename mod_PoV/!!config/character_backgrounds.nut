// Backgrounds Groups (I now use in contracts, potential recruits. Likely usable in events too?)
::Const.PovSoldierBackgrounds <- [
	"legend_noble_shield",
	"legend_noble_2h",
	"legend_noble_ranged"
];
// same as above
::Const.PovMutantBackgrounds <- [
	"pov_mutant_background"
];

// These backgrounds can appear in random start scenarios (solo, trio, company)
::Const.CharacterBackgroundsRandom.extend([
	"pov_vattghern_background",
	"pov_mutant_background",
	"pov_forsaken_background",
	"pov_caravan_guard_background"
]);

// I dont NEED to do this, but oh well why not
::Const.CharacterCombatBackgrounds.extend([
	"pov_mutant_background"
]);