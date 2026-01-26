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
			// championslayer (champ icon skull)
		],
		[
			// refined witcher (vattghern icon)
		],
		[
			// reserved for future: atks and signs interchanged perk!
		]
	]
};
