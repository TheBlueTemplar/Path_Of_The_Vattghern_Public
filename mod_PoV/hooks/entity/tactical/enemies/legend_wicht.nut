::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_wicht", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Additional Flags
		if (!this.actor.getFlags().has("ghost"))
		this.actor.getFlags().add("ghost")
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			// Keep normal ghost corpse? idk maybe yes xd
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Ghost));
	  	}
		
		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// No Mutation For Ghosts Currently
	}

});