::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_armor_white_wolf_pelt_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 5000; //down from 6000
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -2;
		this.m.ThreatModifier = 15;
	}

});

