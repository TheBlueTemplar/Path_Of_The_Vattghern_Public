::TLW.HooksMod.hook("scripts/items/weapons/legend_swordstaff", function (q) {
	
	q.onEquip = @(__original) function ()
	{
		__original();

		local heartseeker = this.new("scripts/skills/actives/legend_heartseeker_skill");
		heartseeker.m.IsPolearm = true;
		this.addSkill(heartseeker);

		::Legends.Actives.grant(this, ::Legends.Active.Lunge, function (_skill) {
			_skill.m.isGreatLunge = true;
		}.bindenv(this));
	}

});

