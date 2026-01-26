::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_pauldron_heavy_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Description = "These segments of steel plate are extremely heavy but excellent for protecting shoulders and arms. Worn over common armor, they can help to deflect incoming blows.";
		this.m.ArmorDescription = "Segments of steel plates provide additional protection.";
		this.m.Value = 2200; //same
		this.m.Condition = 85;
		this.m.ConditionMax = 85;
		this.m.StaminaModifier = -7;
		this.m.DamageReceivedArmorMult = -20.0;
		this.m.DirectDamageModifier = 0.0;
	}

});

