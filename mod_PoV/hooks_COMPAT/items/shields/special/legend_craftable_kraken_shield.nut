::TLW.HooksMod.hook("scripts/items/shields/special/legend_craftable_kraken_shield", function (q) 
{
	q.m.RegularDamage = 25;
	q.m.RegularDamageMax = 35;

	q.resetStats = @(__original) function ()
	{
		this.m.MeleeDefense = 28;
		this.m.RangedDefense = 28;
		this.m.StaminaModifier = -18;
		this.m.Condition = 125;
		this.m.ConditionMax = 125;
	}

});

