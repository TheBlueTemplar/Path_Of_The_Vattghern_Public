::TLW.HooksMod.hook("scripts/items/legend_armor/armor_upgrades/legend_bone_platings_upgrade", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1200; //up from 850
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -3;
	}

});

