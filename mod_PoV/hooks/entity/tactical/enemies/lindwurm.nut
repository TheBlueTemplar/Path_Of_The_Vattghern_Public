::TLW.HooksMod.hook("scripts/entity/tactical/enemies/lindwurm", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Lindwurm));
	  	}
	  	
		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.LindwurmGroup,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// I do the meme
		if (this.actor.getSkills().hasSkill("effects.pov_enemy_mutation_rot"))
		{
			local roll = this.Math.rand(1,100);
			if (roll <= 10)
			{
				this.actor.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "]Stoolwurm[/color]";
			}
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
			b.ActionPoints += 3;

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
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/armor_upgrades/named/pov_named_lindwurm_scales_upgrade"]);
			this.actor.m.OnDeathLootTable.push([1.5,"scripts/items/misc/anatomist/pov_lindwurm_mutagen_upgrade_item"]);

			return true;
		}
	//}

});