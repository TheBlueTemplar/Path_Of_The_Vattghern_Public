::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_redback_spider", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.LegendRedbackSpider));
	  	}

		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.SpiderGroup,false);


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
			b.ActionPoints += 2;
			b.Hitpoints += 30;
			b.MeleeSkill += 10;
			b.MeleeDefense += 3;
			b.RangedDefense += 3;

			b.Armor[this.Const.BodyPart.Head] += 30;
			b.ArmorMax[this.Const.BodyPart.Head] += 30;
			b.Armor[this.Const.BodyPart.Body] += 30;
			b.ArmorMax[this.Const.BodyPart.Body] += 30;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_dodge"));
			getSkills().add(::new("scripts/skills/perks/perk_nimble"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_legend_push_the_advantage"));

				if (::World.getTime().Days >= 150)
					getSkills().add(::new("scripts/skills/perks/perk_legend_ubernimble"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/armor_upgrades/named/pov_named_armor_redback_cloak_upgrade"]);
			this.actor.m.OnDeathLootTable.push([2,"scripts/items/misc/anatomist/pov_spider_mutagen_upgrade_item"]);

			setHitpointsPct(1.0);
			return true;
		}
	//}

});