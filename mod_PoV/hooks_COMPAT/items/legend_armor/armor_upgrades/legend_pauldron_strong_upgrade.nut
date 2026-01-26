::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_pauldron_strong_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Name = "Light Pauldrons";
		this.m.Description = "These light segments of iron plate are strong and excellent for protecting shoulders and neck. Worn over common armor, they can help to deflect incoming blows.";
		this.m.ArmorDescription = "Segments of light iron plates provide rough protection.";
		this.m.Value = 2200; // down fron 2500
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -4;
		this.m.DirectDamageModifier = -20.0;
	}

});

