::TLW.HooksMod.hook("scripts/items/weapons/two_handed_flanged_mace", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.ArmorDamageMult = 1.30;	//+0.05
	}

});

