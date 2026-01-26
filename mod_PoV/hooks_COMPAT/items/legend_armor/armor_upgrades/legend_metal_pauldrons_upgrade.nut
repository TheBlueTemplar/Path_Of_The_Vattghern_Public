::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_metal_pauldrons_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 900; // increased from 800
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -5;
	}

});

