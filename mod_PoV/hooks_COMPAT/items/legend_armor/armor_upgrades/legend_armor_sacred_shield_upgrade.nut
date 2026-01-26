::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_armor_sacred_shield_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 575; //up from 200
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
	}

});

