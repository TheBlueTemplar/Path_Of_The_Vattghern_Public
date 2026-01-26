::TLW.HooksMod.hook("scripts/items/weapons/named/named_throwing_axe", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.IsAgainstShields = true;
		this.m.ShieldDamage = 12;
		//this.updateVariant();
		this.randomizeValues();
	}

	q.randomizeValues = @(__original) function ()
	{
		__original();
		this.m.ShieldDamage = 12;
	}

	q.onEquip = @(__original) function ()
	{
		__original();
		// AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		local chop = this.new("scripts/skills/actives/chop");
		chop.m.IsThrowingWeapon = true;
		this.addSkill(chop);

		local actor = this.getContainer().getActor();
		if (actor.getSkills().hasPerk(::Legends.Perk.LegendSmashingShields))
		{
			local rangedSplitShield = this.new("scripts/skills/actives/pov_ranged_split_shield_skill");
			this.addSkill(rangedSplitShield);
		}
	}

});

