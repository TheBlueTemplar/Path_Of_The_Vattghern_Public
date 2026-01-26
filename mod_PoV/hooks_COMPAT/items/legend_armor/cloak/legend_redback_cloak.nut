::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_redback_cloak", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 5000; //down from 6000
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.ThreatModifier = 3;
	}

});

