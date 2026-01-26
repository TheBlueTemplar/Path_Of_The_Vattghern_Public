::TLW.HooksMod.hook("scripts/items/weapons/legend_sturdy_sling", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 7; //-1
		//this.m.RangeIdeal = 7; //-1
		//this.m.StaminaModifier = -10; //-4
		this.m.RegularDamage = 25; //---
		this.m.RegularDamageMax = 35; //-5
		//this.m.DirectDamageMult = 0.35; //-0.05 THIS DOES NOT WORK!
		this.m.DirectDamageAdd = -0.05; //-0.05
		this.m.ArmorDamageMult = 0.75;	//-0.05
		this.m.AdditionalAccuracy = -5; //-5
	}

});

