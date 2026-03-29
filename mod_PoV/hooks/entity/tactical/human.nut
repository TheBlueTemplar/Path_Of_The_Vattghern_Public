::TLW.HooksMod.hook("scripts/entity/tactical/human", function (q) {

	q.onInit = @(__original) function () {
		__original();

		// Random Trait!
		if (!::MSU.isKindOf(this, "player")) {
			::TLW.EntityTraits.add_random_traits(this);
		}
	}

	q.onDeath = @(__original) function (_killer, _skill, _tile, _fatalityType) {
		if (this.m.Surcoat != null) {
			local brushName = "surcoat_" + (this.m.Surcoat < 10
				? "0" + this.m.Surcoat
				: this.m.Surcoat) + "_dead";
			if (!this.doesBrushExist(brushName)) {
				this.m.Surcoat = null;
			}
		}

		__original(_killer, _skill, _tile, _fatalityType);
	}
});
