::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_armor_white_wolf_pelt_cloak", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 5000; //down from 6000
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -2;
		this.m.ThreatModifier = 15;
	}

});

