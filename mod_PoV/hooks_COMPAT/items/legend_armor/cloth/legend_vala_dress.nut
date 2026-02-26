::TLW.HooksMod.hook("scripts/items/legend_armor/cloth/legend_armor_vala_dress", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
	}

});

