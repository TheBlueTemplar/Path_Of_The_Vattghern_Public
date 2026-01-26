::TLW.HooksMod.hook("scripts/items/shields/named/named_lindwurm_shield", function (q) {
	
	q.resetStats = @(__original) function ()
	{
		this.m.MeleeDefense = 20;
		this.m.RangedDefense = 30;
		this.m.StaminaModifier = -15;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
	}

});

