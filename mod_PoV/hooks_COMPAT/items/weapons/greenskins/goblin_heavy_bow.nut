::TLW.HooksMod.hook("scripts/items/weapons/greenskins/goblin_heavy_bow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 6; 
		//this.m.RangeIdeal = 6; 
		//this.m.StaminaModifier = -6;
		this.m.RegularDamage = 25; //-5
		this.m.RegularDamageMax = 45; //-5
		this.m.DirectDamageMult = 0.35; //---
		//this.m.DirectDamageAdd = -0.05; //-0.05
		this.m.ArmorDamageMult = 0.55;	//-0.05
	}

});

