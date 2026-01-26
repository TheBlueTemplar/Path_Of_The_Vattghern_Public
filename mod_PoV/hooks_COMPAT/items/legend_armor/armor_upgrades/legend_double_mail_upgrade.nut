::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_double_mail_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
	}

});

