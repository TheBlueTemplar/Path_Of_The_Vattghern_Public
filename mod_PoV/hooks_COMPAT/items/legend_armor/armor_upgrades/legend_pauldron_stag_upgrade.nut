::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_pauldron_stag_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		//this.m.Description = "These segments of steel plate are extremely heavy but excellent for protecting shoulders and arms. Worn over common armor, they can help to deflect incoming blows.";
		//this.m.ArmorDescription = "Segments of steel plates provide additional protection.";
		this.m.Value = 2000; // down from 2200
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -6;
		this.m.DirectDamageModifier = -25.0;
	}

});

