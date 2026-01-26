::TLW.HooksMod.hook("scripts/items/weapons/barbarians/heavy_javelin", function (q) {
	
	q.onEquip = @(__original) function ()
	{
		__original();
		local thrust = this.new("scripts/skills/actives/thrust");
		thrust.m.IsThrowingWeapon = true;
		this.addSkill(thrust);
	}

});

