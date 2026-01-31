if (!("Perks" in ::Const))
{
	::Const.Perks <- {};
}

::Const.Perks.VattghernMagicTree <- {
	ID = "VattghernMagicTree",
	Name = "Vatt\'ghern",
	Descriptions = [
		"vatt\'ghern"
	],
	Tree = [
		[
			::Legends.Perk.PovSignsDefense
		],
		[
			::Legends.Perk.PovSignsControl
		],
		[
			::Legends.Perk.PovSignsOffense
		],
		[
			::Legends.Perk.PovSignMastery
		],
		[
			::Legends.Perk.PovChampionSlayer
		],
		[
			::Legends.Perk.PovStabilizedMutations
		],
		[
			// reserved for future: atks and signs interchanged perk OR sth related to v.pots.
		]
	]
};
