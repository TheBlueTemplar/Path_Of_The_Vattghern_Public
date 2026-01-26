::TLW.HooksMod.hook("scripts/items/weapons/oriental/nomad_sling", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 8; //---
		this.m.RangeIdeal = 8; //---
		this.m.StaminaModifier = -12; //-2
		this.m.RegularDamage = 40; //-5
		this.m.RegularDamageMax = 60; //-5
		//this.m.DirectDamageMult = 0.45; //-0.25
		this.m.DirectDamageAdd = -0.25; //-0.25
		this.m.ArmorDamageMult = 1.40;	//-0.10
		this.m.AdditionalAccuracy = -10; //-10
	}

});

