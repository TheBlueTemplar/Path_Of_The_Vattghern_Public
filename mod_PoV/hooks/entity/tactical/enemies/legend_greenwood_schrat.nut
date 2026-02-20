::TLW.HooksMod.hook("scripts/entity/tactical/enemies/legend_greenwood_schrat", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.LegendGreenwoodSchrat));
	  	}
		
		/// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.SchratGroup,false);

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

			b.Armor[this.Const.BodyPart.Head] += 50;
			b.ArmorMax[this.Const.BodyPart.Head] += 50;
			b.Armor[this.Const.BodyPart.Body] += 50;
			b.ArmorMax[this.Const.BodyPart.Body] += 50;

			b.DamageArmorMult += 0.05;
			b.DamageTotalMult += 0.05;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_fearsome"));

			// Drops
			this.actor.m.OnDeathLootTable.push([100,"scripts/items/shields/special/legend_craftable_greenwood_schrat_shield"]);
			this.actor.m.OnDeathLootTable.push([2,"scripts/items/misc/anatomist/pov_schrat_mutagen_upgrade_item"]);

			return true;
		}
	//}
});