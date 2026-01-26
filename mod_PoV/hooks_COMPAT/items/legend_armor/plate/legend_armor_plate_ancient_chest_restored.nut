::TLW.HooksMod.hook("scripts/items/legend_armor/plate/legend_armor_plate_ancient_chest_restored", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -12;
	}

});

