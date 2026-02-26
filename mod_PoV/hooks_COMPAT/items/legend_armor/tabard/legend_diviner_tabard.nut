::TLW.HooksMod.hook("scripts/items/legend_armor/tabard/legend_armor_diviner_tabard", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 12;
		this.m.ConditionMax = 12;
		this.m.Bravery = 5;
	}

});

