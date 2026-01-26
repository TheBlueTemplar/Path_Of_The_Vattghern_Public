::TLW.HooksMod.hook("scripts/items/weapons/crossbow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 6; //+1
		this.m.RangeIdeal = 6; //+1
		//this.m.StaminaModifier = -6;
		//this.m.RegularDamage = 45; 
		//this.m.RegularDamageMax = 65; 
		//this.m.DirectDamageMult = 0.45; //-0.05
		this.m.DirectDamageAdd = -0.05; //-0.05
		this.m.ArmorDamageMult = 0.65;	//-0.05
	}

});

