::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_metal_plating_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
	}

});

