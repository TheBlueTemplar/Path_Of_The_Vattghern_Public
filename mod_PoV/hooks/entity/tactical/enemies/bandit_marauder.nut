::TLW.HooksMod.hook("scripts/entity/tactical/enemies/bandit_marauder", function (q) {

	q.onInit = @(__original) function () {
		__original();
		::TLW.MutateEntity.mutate_entity(this.actor, ::TLW.EnemyMutChance.Default, ::TLW.EnemyMut.Melee, false);
		::TLW.Chaos.add_mutation_all(this.actor, false)
	}

});
