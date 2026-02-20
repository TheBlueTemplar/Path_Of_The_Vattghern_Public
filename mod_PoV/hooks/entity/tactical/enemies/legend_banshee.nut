::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_banshee", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Additional Flags
		if (!this.actor.getFlags().has("ghost"))
		this.actor.getFlags().add("ghost")
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.LegendBanshee));
	  	}

		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		//this.m.Skills.add(this.new("scripts/skills/effects/pov_serpentine_agility_effect"));
		
		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// No Mutation For Ghosts Currently
		
		// Edits of other mods (hooks)
		if (::TLW.hasMC && ::TLW.McTweaks)
		{
			local badThing = this.actor.getSkills().getSkillByID("actives.ghost_possess");
			if (badThing)
			{
				this.actor.getSkills().remove(badThing);
			}
		}

		// Visual Changes
		local body = this.getSprite("body");
		body.Scale = 1.3;
		local head = this.getSprite("head");
		head.Scale = 1.3;
		local blur_1 = this.getSprite("blur_1");
		blur_1.Scale = 1.3;
		local blur_2 = this.getSprite("blur_2");
		blur_2.Scale = 1.3;
	}

	// Make Champ (lets MC handle it if its present, AND the player does not enable tweaks)
	//if(!::TLW.hasMC || ::TLW.McTweaks)
	//{
		q.makeMiniboss = @(__original) function()
		{
			if (!actor.makeMiniboss())
				return false;

			// Bust
			this.getSprite("miniboss").setBrush("bust_miniboss");	

			// Bonus Stats
			local b = m.BaseProperties;
			b.ActionPoints += 3;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_footwork"));
			getSkills().add(::new("scripts/skills/perks/perk_rotation"));
			getSkills().add(::new("scripts/skills/perks/perk_fearsome"));
			getSkills().add(::new("scripts/skills/perks/perk_underdog"));
			getSkills().add(::new("scripts/skills/perks/perk_nine_lives"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_fortified_mind"));
					getSkills().add(::new("scripts/skills/perks/perk_legend_terrifying_visage"));
			}

			// DO SOME VALUE STUFF DROPS
			this.actor.m.OnDeathLootTable.push([100,"scripts/items/accessory/named/pov_named_banshee_trophy_item"]);

			return true;
		}
	//}
		
});