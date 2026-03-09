::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_direwolf_pelt_cloak", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 800; //up from 600
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -1;
		this.m.ThreatModifier = 7;
	}

});

