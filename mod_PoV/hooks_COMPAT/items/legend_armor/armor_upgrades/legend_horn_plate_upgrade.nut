::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_horn_plate_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 5000; //up from 4000
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -7;
		this.m.ThreatModifier = 5;
		this.m.DirectDamageModifier = -30.0;
		this.m.DamageReceivedArmorMult = -10.0;
	}

});

