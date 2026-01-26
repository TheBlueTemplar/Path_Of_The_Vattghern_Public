::TLW.HooksMod.hook("scripts/items/legend_armor/legendary/legend_armor_mountain_named", function (q) {
	/*q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -5;
	}*/

	q.resetStats = @(__original) function ()
	{
		__original();
		this.m.Condition = 275;
		this.m.ConditionMax = 275;
		this.m.StaminaModifier = -26;
	}

});

