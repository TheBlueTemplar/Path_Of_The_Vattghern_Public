::TLW.HooksMod.hook("scripts/items/weapons/javelin", function (q) {
	
	q.onEquip = @(__original) function ()
	{
		__original();
		// I do the thrust muehehehhh
		local thrust = this.new("scripts/skills/actives/thrust");
		thrust.m.IsThrowingWeapon = true;
		this.addSkill(thrust);
	}

});

