::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_armor_skull_chain_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 500; //up from 150
		this.m.Condition = 2;
		this.m.ConditionMax = 2;
		this.m.StaminaModifier = 0;
		this.m.ThreatModifier = 3;
	}

});

