::TLW.HooksMod.hook("scripts/items/weapons/short_bow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 7;
		//this.m.RangeIdeal = 7;
		//this.m.StaminaModifier = -6;
		this.m.RegularDamage = 25; //-5
		this.m.RegularDamageMax = 45; //-5
		//this.m.DirectDamageMult = 0.30; //-0.05
		this.m.DirectDamageAdd = -0.045; //-0.05
		this.m.ArmorDamageMult = 0.45;	//-0.05
	}

});

