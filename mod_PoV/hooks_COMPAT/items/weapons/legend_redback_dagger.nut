::TLW.HooksMod.hook("scripts/items/weapons/legend_redback_dagger", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 100.0;
		this.m.ConditionMax = 100.0;
		this.m.Value = 5000;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 55;
		this.m.ArmorDamageMult = 0.75;
		//this.m.DirectDamageMult = 0.3;
		this.m.DirectDamageAdd = 0.10; //+0.10
	}

});

