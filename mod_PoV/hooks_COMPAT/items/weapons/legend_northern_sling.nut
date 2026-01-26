::TLW.HooksMod.hook("scripts/items/weapons/legend_northern_sling", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 8; //-1
		this.m.RangeIdeal = 8; //-1
		this.m.StaminaModifier = -14; //-2
		this.m.RegularDamage = 45; //-5
		this.m.RegularDamageMax = 70; //-5
		//this.m.DirectDamageMult = 0.50; //-0.25
		this.m.DirectDamageAdd = -0.25; //-0.25
		this.m.ArmorDamageMult = 1.50;	//-0.10
		this.m.AdditionalAccuracy = -10; //-10
	}

});

