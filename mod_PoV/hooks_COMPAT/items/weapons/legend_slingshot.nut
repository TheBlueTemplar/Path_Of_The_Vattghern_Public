::TLW.HooksMod.hook("scripts/items/weapons/legend_slingshot", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 7; //-1
		//this.m.RangeIdeal = 7; //-1
		//this.m.StaminaModifier = -10; //-4
		this.m.RegularDamage = 10; //---
		this.m.RegularDamageMax = 20; //-5
		//this.m.DirectDamageMult = 0.35; //-0.05
		this.m.DirectDamageAdd = -0.05; //-0.05
		this.m.ArmorDamageMult = 0.35;	//+0.25
		//this.m.AdditionalAccuracy = -5; //-5
	}

});

