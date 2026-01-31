this.pov_champion_slayer_perk <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovChampionSlayer);
	}

	function onAdded()
	{
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if(::World.State.getPlayer() != null)
		{
			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				if (actor.getBackground() != null)
				{
					actor.getBackground().m.Modifiers.Training += 0.20;
					//actor.getBackground().onAdded();
				}
			}		
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties)
	{
		if (_targetEntity != null)
		{
			if(_targetEntity.m.IsMiniboss == true)
			{
				_properties.SignIntensity += 0.15;
				_properties.DamageTotalMult *= 1.15;
				_properties.MeleeSkillMult *= 1.15;
				_properties.RangedSkillMult *= 1.15;
			}
		}
	}

});

