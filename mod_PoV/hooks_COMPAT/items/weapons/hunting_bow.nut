::TLW.HooksMod.hook("scripts/items/weapons/hunting_bow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 7;
		//this.m.RangeIdeal = 7;
		//this.m.StaminaModifier = -6;
		this.m.RegularDamage = 35; //-5
		this.m.RegularDamageMax = 55; //-5
		//this.m.DirectDamageMult = 0.30; //-0.05
		this.m.DirectDamageAdd = -0.045; //-0.05
		this.m.ArmorDamageMult = 0.50;	//-0.05
	}

});

