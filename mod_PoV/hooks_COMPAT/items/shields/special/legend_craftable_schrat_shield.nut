::TLW.HooksMod.hook("scripts/items/shields/special/legend_craftable_schrat_shield", function (q) 
{
	q.resetStats = @(__original) function ()
	{
		this.m.MeleeDefense = 20;
		this.m.RangedDefense = 20;
		this.m.StaminaModifier = -12;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
	}

});

