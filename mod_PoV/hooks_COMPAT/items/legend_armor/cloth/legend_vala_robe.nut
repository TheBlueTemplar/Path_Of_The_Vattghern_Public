::TLW.HooksMod.hook("scripts/items/legend_armor/cloth/legend_vala_robe", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
	}

});

