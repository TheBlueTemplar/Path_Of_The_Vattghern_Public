::TLW.HooksMod.hook("scripts/items/weapons/named/named_qatal_dagger", function (q) {

	q.create = @(__original) function () {
		// Currently unchanged
		__original();
	}

});
