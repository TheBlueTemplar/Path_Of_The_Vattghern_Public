::TLW.HooksMod.hook("scripts/items/weapons/named/named_dagger", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 850; //+450
		this.m.RegularDamage = 25; //+5
		this.m.RegularDamageMax = 45; //+5
		//this.m.DirectDamageMult = 0.20; // show default here, below thing changes it
		this.m.DirectDamageAdd = 0.20; //+0.20
		this.m.ArmorDamageMult = 0.70;	//---
	}

});

