::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_basilisk_drone", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.BasiliskDrone));
	  	}

		// Racial
	  	this.m.Skills.add(this.new("scripts/skills/racial/pov_basilisk_racial"));
	  	
		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.BasiliskGroup,false);


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
			b.MeleeSkill += 5;
			b.MeleeDefense += 5;
			b.RangedDefense += 5;

			b.Armor[this.Const.BodyPart.Head] += 40;
			b.ArmorMax[this.Const.BodyPart.Head] += 40;
			b.Armor[this.Const.BodyPart.Body] += 40;
			b.ArmorMax[this.Const.BodyPart.Body] += 40;

			b.DamageArmorMult += 0.10;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_legend_push_the_advantage"));
			getSkills().add(::new("scripts/skills/perks/perk_crippling_strikes"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_fearsome"));
			}

			// Drops
			this.actor.m.OnDeathLootTable.push([100,"scripts/items/accessory/named/pov_named_basilisk_trophy_item"]);

			setHitpointsPct(1.0);
			return true;
		}
	//}

});