::TLW.HooksMod.hook("scripts/items/weapons/named/named_warbow", function (q) {

	q.create = @(__original) function () {
		__original();
		this.m.RegularDamage -= 5;
		this.m.RegularDamageMax -= 5;
		this.m.ArmorDamageMult = ::Math.max(0.0, this.m.ArmorDamageMult - 0.05);
	}

});
