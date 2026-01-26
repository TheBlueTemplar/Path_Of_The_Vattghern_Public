::TLW.HooksMod.hook("scripts/items/weapons/greenskins/goblin_bow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 6; //-1
		this.m.RangeIdeal = 6; //-1
		//this.m.StaminaModifier = -6;
		this.m.RegularDamage = 20; //-5
		this.m.RegularDamageMax = 35; //-5
		//this.m.DirectDamageMult = 0.30; //-0.05
		this.m.DirectDamageAdd = -0.05; //-0.05
		this.m.ArmorDamageMult = 0.50;	//-0.05
	}

});

