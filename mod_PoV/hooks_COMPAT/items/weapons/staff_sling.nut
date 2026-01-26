::TLW.HooksMod.hook("scripts/items/weapons/staff_sling", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 7; //-1
		this.m.RangeIdeal = 7; //-1
		this.m.StaminaModifier = -10; //-4
		this.m.RegularDamage = 35; //-5
		this.m.RegularDamageMax = 55; //-5
		//this.m.DirectDamageMult = 0.40; //-0.25
		this.m.DirectDamageAdd = -0.25; //-0.25
		this.m.ArmorDamageMult = 1.30;	//-0.10
		this.m.AdditionalAccuracy = -10; //-10
	}

});

