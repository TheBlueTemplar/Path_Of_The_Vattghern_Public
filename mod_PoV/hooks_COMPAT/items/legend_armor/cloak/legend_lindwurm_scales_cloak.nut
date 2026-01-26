::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_lindwurm_scales_cloak", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1800; //kept as is
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -3;
		this.m.DirectDamageModifier = -10.0;
	}

});

