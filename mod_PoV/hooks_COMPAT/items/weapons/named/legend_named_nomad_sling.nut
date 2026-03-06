::TLW.HooksMod.hook("scripts/items/weapons/named/legend_named_nomad_sling", function (q) {

	q.create = @(__original) function () {
		__original();
		this.m.StaminaModifier -= 2;
		this.m.RegularDamage -= 5;
		this.m.RegularDamageMax -= 5;
		this.m.DirectDamageMult = ::Math.max(0.0, this.m.DirectDamageMult - 0.25);
		this.m.ArmorDamageMult = ::Math.max(0.0, this.m.ArmorDamageMult - 0.10);
		this.m.AdditionalAccuracy -= 10;
	}

});
