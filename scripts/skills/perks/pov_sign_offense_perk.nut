this.pov_sign_offense_perk <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSignsOffense);
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_igni"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_igni_skill"));
		}

		if (!this.m.Container.hasSkill("actives.pov_bront"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_bront_skill"));
		}
	}

	function onUpdate(_properties)
	{
		_properties.SignIntensity += 0.02;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.pov_igni");
		this.m.Container.removeByID("actives.pov_bront");
	}

});

