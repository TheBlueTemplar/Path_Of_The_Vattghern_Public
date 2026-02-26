::TLW.HooksMod.hook("scripts/items/legend_armor/tabard/legend_armor_fleshcultist_tabard", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 8;
		this.m.ConditionMax = 8;
		this.m.Bravery = 2;
	}

});

