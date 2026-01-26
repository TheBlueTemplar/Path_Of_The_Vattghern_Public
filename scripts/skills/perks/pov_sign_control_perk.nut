this.pov_sign_control_perk <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSignsControl);
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_aard"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_aard_skill"));
		}

		if (!this.m.Container.hasSkill("actives.pov_axii"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_axii_skill"));
		}
	}

	function onUpdate(_properties)
	{
		_properties.SignIntensity += 0.02;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.pov_aard");
		this.m.Container.removeByID("actives.pov_axii");
	}

});

