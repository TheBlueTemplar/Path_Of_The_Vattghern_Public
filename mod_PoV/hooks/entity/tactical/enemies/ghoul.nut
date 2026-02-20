::TLW.HooksMod.hook("scripts/entity/tactical/enemies/ghoul", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Ghoul));
	  	}

		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		if(this.World.Assets.getCombatDifficulty() != this.Const.Difficulty.Easy)
		{
			this.m.Skills.add(this.new("scripts/skills/effects/pov_ghoul_corpse_rush_effect"));
		}

		// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Low,::TLW.EnemyMut.GhoulGroup,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		//Stats Changes
		local b = this.m.BaseProperties;
		if (this.World.getTime().Days >= 75)
		{
			b.Hitpoints *= 1.25;
			b.MeleeSkillMult *= 1.25;
			b.MeleeDamageMult *= 1.10;
			b.InitiativeMult *= 1.15;
		} else
		{
			b.Hitpoints *= 1.125;
			b.MeleeSkillMult *= 1.125;
			b.MeleeDamageMult *= 1.05;
			b.InitiativeMult *= 1.075;
		}	

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
			b.MeleeSkill += 5;
			b.MeleeDefense += 5;
			b.DamageRegularMax += 5;
			b.ActionPoints += 1;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_sundering_strikes"));
			getSkills().add(::new("scripts/skills/actives/charge"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 50)
					getSkills().add(::new("scripts/skills/perks/perk_fearsome"));

				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_nimble"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/accessory/named/pov_named_ghoul_trophy_item"]);
			this.actor.m.OnDeathLootTable.push([1.5,"scripts/items/misc/anatomist/pov_ghoul_mutagen_upgrade_item"]);

			return true;
		}
	//}
		
});