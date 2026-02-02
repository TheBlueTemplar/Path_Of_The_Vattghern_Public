::TLW.HooksMod.hook("scripts/items/weapons/legendary/obsidian_dagger", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.Value = 225; //+45
		this.m.RegularDamage = 30; //+5
		this.m.RegularDamageMax = 45; //---
		//this.m.DirectDamageMult = 0.20; // show default here, below thing changes it
		this.m.DirectDamageAdd = 0.15; //+0.15
		this.m.ArmorDamageMult = 0.80;	//+0.10
	}

});

