::TLW.HooksMod.hook("scripts/entity/tactical/enemies/hyena", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Hyena));
	  	}

	  	// Racial
	  	this.m.Skills.add(this.new("scripts/skills/racial/pov_hyena_racial"));
	  	
		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		if(this.World.Assets.getCombatDifficulty() != this.Const.Difficulty.Easy)
		{
			this.m.Skills.add(this.new("scripts/skills/effects/pov_hyena_pack_mentality_effect"));
		}
		
		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Low,::TLW.EnemyMut.HyenaGroup,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Stats Changes
		local b = this.m.BaseProperties;
		b.ActionPoints += 1;

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
			b.MeleeSkill += 10;
			b.MeleeDefense += 5;
			b.Bravery += 25;

			b.Armor[this.Const.BodyPart.Head] += 30;
			b.ArmorMax[this.Const.BodyPart.Head] += 30;
			b.Armor[this.Const.BodyPart.Body] += 30;
			b.ArmorMax[this.Const.BodyPart.Body] += 30;

			b.DamageArmorMult += 0.08;
			b.DamageDirectMult += 0.08;
			b.DamageTotalMult += 0.05;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_dodge"));
			getSkills().add(::new("scripts/skills/actives/line_breaker"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 50)
					getSkills().add(::new("scripts/skills/perks/perk_overwhelm"));

				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_nimble"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/armor_upgrades/named/pov_named_hyena_fur_upgrade"]);
			this.actor.m.OnDeathLootTable.push([1.5,"scripts/items/misc/anatomist/pov_direwolf_mutagen_upgrade_item"]);

			return true;
		}
	//}

});
