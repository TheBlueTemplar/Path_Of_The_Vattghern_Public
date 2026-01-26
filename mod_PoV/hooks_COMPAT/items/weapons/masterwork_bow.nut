::TLW.HooksMod.hook("scripts/items/weapons/masterwork_bow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 8; //+1
		this.m.RangeIdeal = 8; //+1
		//this.m.StaminaModifier = -6;
		this.m.RegularDamage = 55; //+5
		this.m.RegularDamageMax = 75; //---
		//this.m.DirectDamageMult = 0.40; //+0.05
		this.m.DirectDamageAdd = 0.05; //+0.05
		this.m.ArmorDamageMult = 0.65;	//---
	}

});

