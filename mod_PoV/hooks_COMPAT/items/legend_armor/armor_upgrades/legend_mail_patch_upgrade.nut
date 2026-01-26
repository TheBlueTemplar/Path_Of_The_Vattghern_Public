::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_mail_patch_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 700; // up from 500
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -3;
		this.m.DirectDamageModifier = -10.0;
	}

});

