::TLW.HooksMod.hookTree("scripts/factions/faction", function (q) {
	q.create = @(__original) function () {
		__original();
		// Legends fills m.ContractsByCategory on the base faction prototype only, subclasses never
		// get the slot, so we need to add it back here before adding PoV's own category.
		if (!("ContractsByCategory" in this.m)) {
			this.m.ContractsByCategory <- {
				Economy = [],
				Battle = [],
				Hunt = [],
				Legendary = [],
				Wildcard = []
			};
		}
		this.m.ContractsByCategory.Vattghern <- [];
	}
});
