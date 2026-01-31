::TLW.HooksMod.hook("scripts/items/legend_armor/tabard/legend_common_tabard", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		//this.m.Condition = 115;
		//this.m.ConditionMax = 115;
		//this.m.StaminaModifier = -12;
	}

});

