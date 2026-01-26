::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_light_gladiator_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 800; //up from 400
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -2;
		this.m.ThreatModifier = 2;
	}

});

