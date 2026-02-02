::TLW.HooksMod.hook("scripts/items/weapons/dagger", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 225; //+45
		this.m.RegularDamage = 20; //+5
		this.m.RegularDamageMax = 40; //+5
		//this.m.DirectDamageMult = 0.20; // show default here, below thing changes it
		this.m.DirectDamageAdd = 0.10; //+0.10
		this.m.ArmorDamageMult = 0.60;	//---
	}

});

