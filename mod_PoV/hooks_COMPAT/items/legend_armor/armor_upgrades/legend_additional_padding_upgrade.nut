::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_additional_padding_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1500; //up from 1200
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
		this.m.DirectDamageModifier = -25.0;
	}

});

