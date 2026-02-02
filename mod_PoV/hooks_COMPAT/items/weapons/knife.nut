::TLW.HooksMod.hook("scripts/items/weapons/knife", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 60; //+30
		this.m.RegularDamage = 15; //---
		this.m.RegularDamageMax = 30; //+5
		//this.m.DirectDamageMult = 0.20; // show default here, below thing changes it
		this.m.DirectDamageAdd = 0.05; //+0.05
		this.m.ArmorDamageMult = 0.45;	//-0.05
	}

});

