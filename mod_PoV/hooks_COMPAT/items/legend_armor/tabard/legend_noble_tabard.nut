::TLW.HooksMod.hook("scripts/items/legend_armor/tabard/legend_armor_tabard_noble", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Name = "Quality Tabard";
	}

});

