::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_heraldic_plates_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -7;
	}

});

