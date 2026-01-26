::TLW.HooksMod.hook("scripts/items/legend_helmets/named/legend_named_lindwurm_helmet", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -6;
	}

});

