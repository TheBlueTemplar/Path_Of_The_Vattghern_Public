::TLW.HooksMod.hook("scripts/skills/actives/reload_handgonne_skill", function ( q ) {

	q.onAfterUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		this.m.ActionPointCost = 9;
		if (_properties.IsSpecializedInCrossbows)
			this.m.ActionPointCost -= 3; 
		if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendSpecialistInventor))
			this.m.ActionPointCost -= 1;
	}

});	
