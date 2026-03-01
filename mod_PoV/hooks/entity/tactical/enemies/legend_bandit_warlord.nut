// ::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_bandit_warlord", function ( q ) {
// // ABYSSS
// // When 19.3 rolls, please comment out this entire file.
// // Do not just delete it plz, as that change might be reverted
// 	q.onInit = @(__original) function()
// 	{
// 		__original()

// 		/// Enemy Mutation System
// 		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
// 		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
// 		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Melee,false);

// 		// Chaos Mutation
// 		::TLW.Chaos.add_mutation_all(this.actor, false)

// 	}

// });
