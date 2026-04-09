::TLW.HooksMod.hook("scripts/items/weapons/named/named_greatsword", function (q) {

	q.onEquip = @(__original) function ()
	{
		__original();
		::Legends.Actives.remove(this, ::Legends.Active.Puncture); // Remove Old Halfsword Implementation
		local thrust = this.new("scripts/skills/actives/thrust"); // Add PoV's new one
		thrust.m.IsGreatSword = true;
		this.addSkill(thrust);
	}
	
});

