::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_heavy_gladiator_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1500; //up from 800
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -4;
		this.m.ThreatModifier = 3;
	}

});

