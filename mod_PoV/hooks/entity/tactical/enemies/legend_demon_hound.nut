::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_demon_hound", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.LegendDemonHound));
	  	}

	  	/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.SkeletonGroup,false);

		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		//Stats Changes
		local b = this.m.BaseProperties;
		if (this.World.getTime().Days >= 75)
		{
			b.Hitpoints *= 1.50;
			b.MeleeSkillMult *= 1.40;
			b.MeleeDefenseMult *= 1.35;
			b.MeleeDamageMult *= 1.10;
			b.InitiativeMult *= 1.15;
		} else
		{
			b.Hitpoints *= 1.35;
			b.MeleeSkillMult *= 1.25;
			b.MeleeDefenseMult *= 1.20;
			b.MeleeDamageMult *= 1.05;
			b.InitiativeMult *= 1.075;
		}

	}

});