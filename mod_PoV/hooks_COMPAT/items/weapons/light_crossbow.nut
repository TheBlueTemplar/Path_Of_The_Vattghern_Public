::TLW.HooksMod.hook("scripts/items/weapons/light_crossbow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 6; //+1
		this.m.RangeIdeal = 6; //+1
		//this.m.StaminaModifier = -6;
		//this.m.RegularDamage = 45; 
		//this.m.RegularDamageMax = 65; 
		//this.m.DirectDamageMult = 0.40; //-0.10
		this.m.DirectDamageAdd = -0.10; //-0.10
		this.m.ArmorDamageMult = 0.55;	//-0.05
	}

});

