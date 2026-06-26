::TLW.HooksMod.hook("scripts/entity/tactical/humans/legend_barbarian_bloodletter", function (q) {

	q.onInit = @(__original) function () {
		__original();
		::TLW.MutateEntity.mutate_entity(this.actor, ::TLW.EnemyMutChance.Default, ::TLW.EnemyMut.RangedNorth, false);
		::TLW.Chaos.add_mutation_all(this.actor, false)
	}

});
