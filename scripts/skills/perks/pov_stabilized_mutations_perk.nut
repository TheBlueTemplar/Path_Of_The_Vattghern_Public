this.pov_stabilized_mutations_perk <- this.inherit("scripts/skills/skill", {
	m = {
		IsApplied = false
	},
	function create()
	{
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovStabilizedMutations);
	}

	function onAdded()
	{
		if (!this.m.IsApplied)
		{
			this.m.IsApplied = true;
			local actor = this.getContainer().getActor();
			actor.m.LevelUps += 1;
			actor.fillAttributeLevelUpValues(1, false, true);
		}
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.IsApplied = true;
	}

});

