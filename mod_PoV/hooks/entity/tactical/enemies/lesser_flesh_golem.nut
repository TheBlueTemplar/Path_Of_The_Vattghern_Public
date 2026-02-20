::TLW.HooksMod.hook("scripts/entity/tactical/enemies/lesser_flesh_golem", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		if(this.World.Assets.getCombatDifficulty() != this.Const.Difficulty.Easy)
		{
			this.m.Skills.add(this.new("scripts/skills/effects/pov_flesh_golem_buff_effect"));
			this.m.Skills.add(this.new("scripts/skills/effects/pov_unbearable_stench_passive_effect"));
		}

		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.FleshGolem));
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
		b.MeleeSkill += 10;
		b.Bravery += 15;
		b.ActionPoints += 1;

		b.Armor[this.Const.BodyPart.Head] += 20;
		b.ArmorMax[this.Const.BodyPart.Head] += 20;
		b.Armor[this.Const.BodyPart.Body] += 20;
		b.ArmorMax[this.Const.BodyPart.Body] += 20;

		b.DamageArmorMult += 0.10;

		// Bonus Skills
		getSkills().add(::new("scripts/skills/perks/perk_fearsome"));

		// Bonus Skills (Day-Based)
		if (!::Tactical.State.isScenarioMode()) {
			if (::World.getTime().Days >= 50)
				getSkills().add(::new("scripts/skills/perks/perk_overwhelm"));

			if (::World.getTime().Days >= 75)
				getSkills().add(::new("scripts/skills/perks/perk_nimble"));
		}

		// Drops
		this.actor.m.OnDeathLootTable.push([100,"scripts/items/misc/potion_of_knowledge_item"]);
		this.actor.m.OnDeathLootTable.push([100,"scripts/items/loot/pov_ivory_spine_shard_item"]);

		return true;
	}
	
});
