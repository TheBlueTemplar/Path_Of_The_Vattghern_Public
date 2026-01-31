::TLW.HooksMod.hook("scripts/items/tools/player_banner", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Variants.push(1822);
		this.m.Variants.push(1823);
	}

	q.onEquip = @(__original) function ()
	{
		__original();

		local heartseeker = this.new("scripts/skills/actives/legend_heartseeker_skill");
		//heartseeker.m.Icon = "skills/pov_active_silver_heartseeker.png";
		//heartseeker.m.IconDisabled = "skills/pov_active_silver_heartseeker_sw.png";
		//heartseeker.m.Overlay = "pov_active_silver_heartseeker";
		heartseeker.m.IsPolearm = true;
		this.addSkill(heartseeker);
	}

});

