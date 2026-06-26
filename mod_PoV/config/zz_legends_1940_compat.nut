// vanilla 1.5.2.2 removed IsResistantToMiasma, I've added it back so that Pov miasma system
// and the alp mutagen / iron lungs effects who still read and write it work without crashing.
if (!("IsResistantToMiasma" in ::Const.CharacterProperties)) {
	::Const.CharacterProperties.IsResistantToMiasma <- false;
}
