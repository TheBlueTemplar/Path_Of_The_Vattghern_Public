::TLW.HooksMod.hook("scripts/items/weapons/oriental/composite_bow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 7;
		//this.m.RangeIdeal = 7;
		//this.m.StaminaModifier = -6;
		this.m.RegularDamage = 40; //---
		this.m.RegularDamageMax = 60; //+5
		this.m.DirectDamageMult = 0.30; //---
		//this.m.DirectDamageAdd = -0.05; //-0.05
		this.m.ArmorDamageMult = 0.85;	//+0.10
	}

});

