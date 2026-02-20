::TLW.HooksMod.hook("scripts/entity/tactical/enemies/serpent", function ( q ) {

	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Serpent));
	  	}

		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		if(this.World.Assets.getCombatDifficulty() != this.Const.Difficulty.Easy)
		{
			this.m.Skills.add(this.new("scripts/skills/effects/pov_serpentine_agility_effect"));
		}
		
		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.SerpentGroup,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

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
			b.ActionPoints += 1;
			b.Hitpoints += 25;
			b.MeleeSkill += 10;
			b.MeleeDefense += 5;
			b.RangedDefense += 15;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_nimble"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_fearsome"));

				if (::World.getTime().Days >= 160)
					getSkills().add(::new("scripts/skills/perks/perk_legend_ubernimble"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([100,"scripts/items/armor_upgrades/named/pov_named_serpent_skin_upgrade"]);

			setHitpointsPct(1.0);
			return true;
		}
	//}
		
});