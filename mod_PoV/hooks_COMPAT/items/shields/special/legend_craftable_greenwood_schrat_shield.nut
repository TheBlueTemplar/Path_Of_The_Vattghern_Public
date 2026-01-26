::TLW.HooksMod.hook("scripts/items/shields/special/legend_craftable_greenwood_schrat_shield", function (q) 
{
	q.resetStats = @(__original) function ()
	{
		this.m.MeleeDefense = 30;
		this.m.RangedDefense = 25;
		this.m.StaminaModifier = -12;
		this.m.Condition = 90;
		this.m.ConditionMax = 90;
	}

});

