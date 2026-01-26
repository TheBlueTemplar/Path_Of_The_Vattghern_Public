::TLW.HooksMod.hook("scripts/items/legend_armor/cloak/legend_serpent_skin_cloak", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1200; //up from 800
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
		this.m.InitiativeModifier = 10;
	}

});

