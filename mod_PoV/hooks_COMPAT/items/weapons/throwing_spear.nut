::TLW.HooksMod.hook("scripts/items/weapons/throwing_spear", function (q) {
	
	q.onEquip = @(__original) function ()
	{
		__original();
		local thrust = this.new("scripts/skills/actives/thrust");
		thrust.m.IsHeavyThrowingWeapon = true;
		this.addSkill(thrust);
	}

});

