::TLW.HooksMod.hook("scripts/items/legend_armor/tabard/legend_noble_tabard", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Name = "Quality Tabard";
	}

});

