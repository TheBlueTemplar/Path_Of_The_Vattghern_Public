::TLW.HooksMod.hook("scripts/items/weapons/named/named_dagger", function (q) {

	q.create = @(__original) function () {
		__original();
		this.m.RegularDamage += 5;
		this.m.RegularDamageMax += 5;
		this.m.DirectDamageMult = ::Math.minf(1.0, this.m.DirectDamageMult + 0.20);
	}

});
