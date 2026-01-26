::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_stollwurm_scales_cloak", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 5000; //down from 9000
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.DirectDamageModifier = -15.0;
	}

});

