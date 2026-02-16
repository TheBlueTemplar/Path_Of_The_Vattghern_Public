::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_orc_mad_berserker", function ( q )
{
	// Stronger orc berserker = +corpse drop and mutation chance
	q.onInit = @(__original) function()
	{
		__original()

		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			local corpseDrop = ::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.OrcBerserker);
			corpseDrop[0] += 14; // Increase corpse drop chance
			this.actor.m.OnDeathLootTable.push([corpseDrop[0],corpseDrop[1]]);
	  	}

	  	/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.OrcGroup,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)


	}

});