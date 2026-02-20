::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_light_padding_replacement_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1750; // -250
		this.m.Condition = 5; // -5
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.FatiguePenaltyMultiplier = -25.0; // -5
	}

});

