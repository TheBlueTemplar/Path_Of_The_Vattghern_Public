::TLW.HooksMod.hook("scripts/entity/tactical/enemies/fault_finder", function ( q )
{

	q.onInit = @(__original) function()
	{
		__original()

		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.FaultFinder));
	  	}

	  	// Racial
	  	this.m.Skills.add(this.new("scripts/skills/racial/pov_fault_finder_racial"));

	  	// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Tank,false);


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)


	}

	q.makeMiniboss = @(__original) function()
	{
		if (!actor.makeMiniboss())
			return false;

		// Bust
		this.getSprite("miniboss").setBrush("bust_miniboss");	

		// Bonus Stats
		local b = m.BaseProperties;
		b.Hitpoints += 10;
		b.MeleeSkill += 10;
		b.MeleeDefense += 5;
		b.ActionPoints += 1;

		b.Armor[this.Const.BodyPart.Head] += 50;
		b.ArmorMax[this.Const.BodyPart.Head] += 50;
		b.Armor[this.Const.BodyPart.Body] += 50;
		b.ArmorMax[this.Const.BodyPart.Body] += 50;

		b.DamageTotalMult += 0.10;

		// Bonus Skills
		getSkills().add(::new("scripts/skills/perks/perk_fearsome"));
		getSkills().add(::new("scripts/skills/perks/perk_nimble"));

		// Bonus Skills (Day-Based)
		if (!::Tactical.State.isScenarioMode()) {
			if (::World.getTime().Days >= 50)
				getSkills().add(::new("scripts/skills/perks/perk_overwhelm"));
		}

		// Drops
		this.actor.m.OnDeathLootTable.push([100,"scripts/items/misc/legend_ancient_scroll_item"]);

		return true;
	}

});