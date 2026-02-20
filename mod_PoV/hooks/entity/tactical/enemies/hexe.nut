::TLW.HooksMod.hook("scripts/entity/tactical/enemies/hexe", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Hexe));
	  	}
	  	
		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.HexeGroup,false);


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
			if (b.getMeleeSkill() < 40)
				b.MeleeSkill = 40;

			if (b.getRangedSkill() < 65)
				b.RangedSkill = 65;

			b.Hitpoints += 50;

			b.Armor[this.Const.BodyPart.Head] += 40;
			b.ArmorMax[this.Const.BodyPart.Head] += 40;
			b.Armor[this.Const.BodyPart.Body] += 40;
			b.ArmorMax[this.Const.BodyPart.Body] += 40;
			b.DamageReceivedRegularMult *= 0.90;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_anticipation"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 100)
					getSkills().add(::new("scripts/skills/perks/perk_nimble"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/accessory/named/pov_named_hexe_trophy_item"]);
			this.actor.m.OnDeathLootTable.push([1.5,"scripts/items/misc/anatomist/pov_hexe_mutagen_upgrade_item"]);

			return true;
		}
	//}

});