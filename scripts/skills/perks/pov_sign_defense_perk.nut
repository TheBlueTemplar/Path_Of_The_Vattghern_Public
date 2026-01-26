this.pov_sign_defense_perk <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSignsDefense);
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_quen"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_quen_skill"));
		}

		if (!this.m.Container.hasSkill("actives.pov_yrden"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_yrden_skill"));
		}
	}

	function onUpdate(_properties)
	{
		_properties.SignIntensity += 0.02;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.pov_quen");
		this.m.Container.removeByID("actives.pov_yrden");
	}

});

