::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_stollwurm", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.LegendStollwurm));
	  	}

		// Racial
	  	this.m.Skills.add(this.new("scripts/skills/racial/pov_stollwurm_racial"));

	  	/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.LindwurmGroup,false);


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

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_legend_bloody_harvest"));

			// tail?
			if (!::MSU.isNull(m.Tail)) {
				m.Tail.makeMiniboss();
				m.Tail.getSkills().add(::new("scripts/skills/perks/perk_legend_bloody_harvest"));
			}

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode() && ::World.getTime().Days >= 150)
				getSkills().add(::new("scripts/skills/perks/perk_colossus"));

			// Drops
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/armor_upgrades/named/pov_named_stollwurm_scales_upgrade"]);
			this.actor.m.OnDeathLootTable.push([2,"scripts/items/misc/anatomist/pov_lindwurm_mutagen_upgrade_item"]);

			return true;
		}
	//}

});