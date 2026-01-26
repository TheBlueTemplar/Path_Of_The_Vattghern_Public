::TLW.HooksMod.hook("scripts/items/legend_armor/named/legend_lindwurm_scale_armor", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -5;
	}

	q.resetStats = @(__original) function ()
	{
		__original();
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -5;
	}

});

