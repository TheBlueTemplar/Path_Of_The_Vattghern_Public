::TLW.HooksMod.hook("scripts/entity/tactical/goblin", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()

		// Corpse Drop
		if (!::MSU.isKindOf(this, "player")) 
		{
			//cool kids use switchcases
			local corpse;
	        if (::MSU.isKindOf(this, "goblin_shaman")) {
	            corpse = ::TLW.Corpse.GoblinShaman;
	        } else if (::MSU.isKindOf(this, "goblin_leader")) {
	            corpse = ::TLW.Corpse.GoblinLeader;
	        } else {
	            corpse = ::TLW.Corpse.Goblin;
	        }

	        if (corpse != null) {
	            this.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(this, corpse));
	        } else {
	            ::TLW.Mod.Debug.printLog("No corpse found for " + this.getName());
	        }
	  	}

	  	// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		
		if (::MSU.isKindOf(this, "goblin_shaman")) {
            ::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.GoblinGroup,false);
        } else if (::MSU.isKindOf(this, "goblin_leader")) {
            ::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.GoblinGroup,false);
        } else {
            ::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Low,::TLW.EnemyMut.GoblinGroup,false);
        }

		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Stats Changes
		// Nerf on Goblins - REVERT IF LEGENDS NERFS TOO
		local b = this.m.BaseProperties;
		switch (this.World.Assets.getCombatDifficulty())
		{
			case this.Const.Difficulty.Easy:
			{
				b.Hitpoints *= 0.80;
				b.RangedDamageMult *= 0.80;
				b.DamageDirectMult *= 0.85;
				b.MeleeDamageMult *= 0.80;
				b.MeleeDefenseMult *= 0.85;
				b.InitiativeMult *= 0.85;
				break;
			} 
			case this.Const.Difficulty.Normal:
			{
				b.Hitpoints *= 0.85;
				b.RangedDamageMult *= 0.85;
				b.DamageDirectMult *= 0.85;
				b.MeleeDamageMult *= 0.85;
				b.MeleeDefenseMult *= 0.90;
				b.InitiativeMult *= 0.90;
				break;
			}	
			case this.Const.Difficulty.Hard:
			{
				b.Hitpoints *= 0.90;
				b.RangedDamageMult *= 0.90;
				b.DamageDirectMult *= 0.90;
				b.MeleeDamageMult *= 0.90;
				b.MeleeDefenseMult *= 0.95;
				b.InitiativeMult *= 0.95;
				break;
			} 
			case this.Const.Difficulty.Legendary:
			{
				b.Hitpoints *= 0.95;
				b.RangedDamageMult *= 0.95;
				b.DamageDirectMult *= 0.95;
				b.MeleeDamageMult *= 0.95;
				b.MeleeDefenseMult *= 0.95;
				b.InitiativeMult *= 0.95;
				break;
			}
		}
	}

});