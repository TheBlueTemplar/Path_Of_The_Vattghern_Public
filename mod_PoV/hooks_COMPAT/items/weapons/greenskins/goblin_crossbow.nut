::TLW.HooksMod.hook("scripts/items/weapons/greenskins/goblin_crossbow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		//this.m.RangeMax = 7;
		//this.m.RangeIdeal = 7;
		//this.m.StaminaModifier = -6;
		//this.m.RegularDamage = 45; 
		//this.m.RegularDamageMax = 65; 
		//this.m.DirectDamageMult = 0.35; //-0.15
		this.m.DirectDamageAdd = -0.15; //-0.15
		this.m.ArmorDamageMult = 0.95;	//+0.20
	}

	q.onEquip = @(__original) function ()
	{
		__original();
		local actor = this.getContainer().getActor();
		local skill;
		if (actor != null && actor.getSkills().hasSkill("actives.legend_sprint"))
		{
			skill = actor.getSkills().getSkillByID("actives.legend_sprint");
			actor.getSkills().remove(skill);
			// The getTooltip() function in fire_handgonne_skill has logic to display this bonus
		}
	}
	
});

