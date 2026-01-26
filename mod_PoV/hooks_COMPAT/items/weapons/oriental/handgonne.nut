::TLW.HooksMod.hook("scripts/items/weapons/oriental/handgonne", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 50.0; //-10
		this.m.ConditionMax = 50.0; //-10
		this.m.StaminaModifier = -16; //-2
		this.m.ArmorDamageMult = 1.0; //+0.10
	}

	q.onEquip = @(__original) function ()
	{
		__original();
		// AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		local strike = this.new("scripts/skills/actives/knock_out");
		strike.m.IsRangedKnockOut = true;
		this.addSkill(strike);
	}

});

