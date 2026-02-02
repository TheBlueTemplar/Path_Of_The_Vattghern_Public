::TLW.HooksMod.hook("scripts/items/weapons/named/named_two_handed_mace", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.ArmorDamageMult = 1.30;	//+0.05
	}

});

