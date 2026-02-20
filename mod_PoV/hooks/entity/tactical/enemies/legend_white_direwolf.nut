::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_white_direwolf", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.LegendWhiteDirewolf));
	  	}

	  	// Other Drops (If Champion)
	  	if(this.actor.m.IsMiniboss == true)
	  	{
	  		this.actor.m.OnDeathLootTable.push([2,"scripts/items/misc/anatomist/pov_direwolf_mutagen_upgrade_item"]);
	  	}

		// Racial
	  	this.m.Skills.add(this.new("scripts/skills/racial/pov_direwolf_racial"));

		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.DirewolfGroup,false);


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
			b.MeleeDefense += 3;
			b.Bravery += 5;
			b.ActionPoints += 1;

			b.Armor[this.Const.BodyPart.Head] += 50;
			b.ArmorMax[this.Const.BodyPart.Head] += 50;
			b.Armor[this.Const.BodyPart.Body] += 50;
			b.ArmorMax[this.Const.BodyPart.Body] += 50;

			b.DamageArmorMult += 0.6;
			b.DamageTotalMult += 0.04;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_fearsome"));
			getSkills().add(::new("scripts/skills/actives/line_breaker"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 50)
					getSkills().add(::new("scripts/skills/perks/perk_overwhelm"));

				if (::World.getTime().Days >= 100)
					getSkills().add(::new("scripts/skills/perks/perk_nimble"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([1000,"scripts/items/armor_upgrades/named/pov_named_white_direwolf_pelt_upgrade"]);
			this.actor.m.OnDeathLootTable.push([1.5,"scripts/items/misc/anatomist/pov_direwolf_mutagen_upgrade_item"]);

			return true;
		}
	//}

});