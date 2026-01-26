::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_pauldron_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Name = "Iron Pauldrons";
		this.m.Description = "These segments of iron plate are heavy and impractical, but a cheap option for protecting shoulders. Worn over common armor, they can help to deflect incoming blows.";
		this.m.ArmorDescription = "Segments of iron plates provide rough protection.";
		this.m.Value = 600; //down from 2000
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -7;
		this.m.DirectDamageModifier = -15.0;
	}

});

