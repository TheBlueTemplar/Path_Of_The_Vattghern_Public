::TLW.HooksMod.hook("scripts/items/weapons/oriental/qatal_dagger", function (q) {
	
	q.create = @(__original) function ()
	{
		// Currently unchanged, lmao
		__original();
		this.m.Value = 1000; //---
		this.m.RegularDamage = 30; //---
		this.m.RegularDamageMax = 45; //---
		//this.m.DirectDamageMult = 0.20; // show default here, below thing changes it
		//this.m.DirectDamageAdd = 0.20; //---
		this.m.ArmorDamageMult = 0.70;	//---
	}

});

