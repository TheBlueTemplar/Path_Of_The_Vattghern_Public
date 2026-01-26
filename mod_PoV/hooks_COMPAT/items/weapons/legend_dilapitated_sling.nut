::TLW.HooksMod.hook("scripts/items/weapons/legend_dilapitated_sling", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 7; //-1
		//this.m.RangeIdeal = 7; //-1
		//this.m.StaminaModifier = -10; //-4
		this.m.RegularDamage = 20; //---
		this.m.RegularDamageMax = 30; //-5
		//this.m.DirectDamageMult = 0.30; //-0.10
		this.m.DirectDamageAdd = -0.10; //-0.10
		this.m.ArmorDamageMult = 0.65;	//-0.10
		this.m.AdditionalAccuracy = -5; //-5
	}

});

