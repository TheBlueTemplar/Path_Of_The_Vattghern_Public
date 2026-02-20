::TLW.HooksMod.hook("scripts/entity/tactical/enemies/alp", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original();
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Alp));
	  	}
	  	
		// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.AlpGroup,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		//Stats Changes
		local b = this.m.BaseProperties;
		if (this.World.getTime().Days >= 75)
		{
			b.Hitpoints *= 1.20;
			b.MeleeDefenseMult *= 1.10;
		} else
		{
			b.Hitpoints *= 1.10;
			b.MeleeDefenseMult *= 1.05;
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
			b.MeleeDefense += 10;
			b.RangedDefense += 15;
			b.Bravery += 5;
			b.ActionPoints += 1;

			b.Armor[this.Const.BodyPart.Head] += 25;
			b.ArmorMax[this.Const.BodyPart.Head] += 25;
			b.Armor[this.Const.BodyPart.Body] += 25;
			b.ArmorMax[this.Const.BodyPart.Body] += 25;
			b.DamageReceivedRegularMult *= 0.90;

			b.DamageTotalMult += 0.05;

			// Bonus Skills

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_nimble"));

				if (::World.getTime().Days >= 100)
					getSkills().add(::new("scripts/skills/perks/perk_fortified_mind"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/accessory/named/pov_named_alp_trophy_item"]);
			this.actor.m.OnDeathLootTable.push([1.5,"scripts/items/misc/anatomist/pov_alp_mutagen_upgrade_item"]);

			return true;
		}
	//}

});