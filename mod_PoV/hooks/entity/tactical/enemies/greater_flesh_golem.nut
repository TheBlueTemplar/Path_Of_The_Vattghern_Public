::TLW.HooksMod.hook("scripts/entity/tactical/enemies/greater_flesh_golem", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		if(this.World.Assets.getCombatDifficulty() != this.Const.Difficulty.Easy)
		{
			this.m.Skills.add(this.new("scripts/skills/effects/pov_greater_flesh_golem_buff_effect"));
			this.m.Skills.add(this.new("scripts/skills/effects/pov_unbearable_stench_passive_effect"));
		}
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			// Corpse Rate Modifier Example
			//local corpseDrop = ::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.FleshGolem);
			//corpseDrop[0] += 12; // Increase corpse drop chance
			//this.actor.m.OnDeathLootTable.push([corpseDrop[0],corpseDrop[1]]);
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.GreaterFleshGolem));
	  	}
		
		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Tank,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Remove some shit
		if (this.actor.getSkills().hasSkill("perk.nimble"))
		{
			this.actor.getSkills().removeByID("perk.nimble");
		}
		if (this.actor.getSkills().hasSkill("perk.legend_anchor"))
		{
			this.actor.getSkills().removeByID("perk.legend_anchor");
		}
		if (this.actor.getSkills().hasSkill("perk.legend_battleheart"))
		{
			this.actor.getSkills().removeByID("perk.legend_battleheart");
		}
	}

	q.makeMiniboss = @(__original) function()
	{
		if (!actor.makeMiniboss())
			return false;

		// Bust
		this.getSprite("miniboss").setBrush("bust_miniboss");	

		// Bonus Stats
		local b = m.BaseProperties;
		b.Bravery += 15;
		b.ActionPoints += 1;

		b.Armor[this.Const.BodyPart.Head] += 30;
		b.ArmorMax[this.Const.BodyPart.Head] += 30;
		b.Armor[this.Const.BodyPart.Body] += 30;
		b.ArmorMax[this.Const.BodyPart.Body] += 30;

		b.DamageArmorMult += 0.10;

		// Bonus Skills
		getSkills().add(::new("scripts/skills/perks/perk_fearsome"));

		// Bonus Skills (Day-Based)
		if (!::Tactical.State.isScenarioMode()) {
			if (::World.getTime().Days >= 75)
				getSkills().add(::new("scripts/skills/perks/perk_overwhelm"));
		}

		// Drops
		this.actor.m.OnDeathLootTable.push([100,"scripts/items/misc/potion_of_knowledge_item"]);
		this.actor.m.OnDeathLootTable.push([100,"scripts/items/loot/pov_ivory_spine_shard_item"]);

		return true;
	}

});
