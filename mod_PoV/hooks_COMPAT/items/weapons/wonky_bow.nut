::TLW.HooksMod.hook("scripts/items/weapons/wonky_bow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 6; //-1
		this.m.RangeIdeal = 6; //-1
		//this.m.StaminaModifier = -6;
		this.m.RegularDamage = 20; //-10
		this.m.RegularDamageMax = 40; //-10
		//this.m.DirectDamageMult = 0.25; //-0.10
		this.m.DirectDamageAdd = -0.10; //-0.10
		this.m.ArmorDamageMult = 0.40;	//-0.10
	}

});

