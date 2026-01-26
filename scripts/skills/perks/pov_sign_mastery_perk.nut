this.pov_sign_mastery_perk <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSignMastery);
	}

	function onUpdate(_properties)
	{
		_properties.SignIntensity += 0.20;
		_properties.IsSpecializedInSigns = true;
	}

});

