::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_armor_spiked_collar_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 880; //up from 200
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -4;
		this.m.ThreatModifier = 2;
	}

});

