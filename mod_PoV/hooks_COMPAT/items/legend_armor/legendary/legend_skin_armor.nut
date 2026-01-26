::TLW.HooksMod.hook("scripts/items/legend_armor/legendary/legend_skin_armor", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -6;
	}

	q.resetValues = @(__original) function ()
	{
		__original();
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -6;
	}

});

