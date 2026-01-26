::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_hyena_fur_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 800; //up from 600
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = 3;
		this.m.InitiativeModifier = 15;
	}

});

