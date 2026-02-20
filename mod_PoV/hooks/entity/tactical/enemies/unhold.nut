//make switchcase here too	//ok i did, thanks past me, you lazy fuck smh
::TLW.HooksMod.hook("scripts/entity/tactical/enemies/unhold", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()

		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			local corpse;
	        if (::MSU.isKindOf(this, "unhold_bog")) {
	            corpse = ::TLW.Corpse.UnholdBog;
	        } else if (::MSU.isKindOf(this, "unhold_frost")) {
	            corpse = ::TLW.Corpse.UnholdFrost;
	        } else {
	            corpse = ::TLW.Corpse.Unhold;
	        }

	        if (corpse != null) {
	            this.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(this, corpse));
	        } else {
	            ::TLW.Mod.Debug.printLog("No corpse found for " + this.getName());
	        }
	  	}

	  	// Racial
	  	 if (::MSU.isKindOf(this, "unhold_bog")){
	            this.m.Skills.add(this.new("scripts/skills/racial/pov_bog_unhold_racial"));
	        } else if (::MSU.isKindOf(this, "unhold_frost")){
	            this.m.Skills.add(this.new("scripts/skills/racial/pov_frost_unhold_racial"));
	        } else {
	            this.m.Skills.add(this.new("scripts/skills/racial/pov_unhold_racial"));
	        }
	  	

		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		if(this.World.Assets.getCombatDifficulty() != this.Const.Difficulty.Easy)
		{
			this.m.Skills.add(this.new("scripts/skills/effects/pov_unhold_waning_fury_effect"));
			if (::MSU.isKindOf(this, "unhold_bog")) {
				this.m.Skills.add(this.new("scripts/skills/effects/pov_unbearable_stench_passive_effect"));
			}
		}

		// Enemy Mutation System
		// Second arg (int) reference in Enemy_Mutations.nut, lines 22+
		// Third arg (array) reference in Enemy_Mutation_Arrays.nut, in afterhooks (rest in prev file, bottom)
		if (::MSU.isKindOf(this, "unhold_bog")) {
            ::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.UnholdGroup,false);
        } else if (::MSU.isKindOf(this, "unhold_frost")) {
            ::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.UnholdGroup,false);
        } else {
			::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Medium,::TLW.EnemyMut.UnholdGroup,false);
        }


		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)


		// Debug - Test
		//::TLW.EnemyMutations.add_mutation_enemy_vampire(this.actor, false);
		// Special Sprite n Name
		if (this.actor.getSkills().hasSkill("effects.pov_enemy_mutation_vampire"))
		{
			local roll = this.Math.rand(1,100);
			if (roll <= 10)
			{
				if (this.actor.hasSprite("pov_head_effect"))
				{
					if (::MSU.isKindOf(this, "unhold_bog"))
					{
						local memeSprite = this.actor.getSprite("pov_head_effect");
						memeSprite.setBrush("pov_vamphold_03");
						//memeSprite.Scale = 1.25;
						memeSprite.Visible = true;
					}
					else if (::MSU.isKindOf(this, "unhold_frost"))
					{
						local memeSprite = this.actor.getSprite("pov_head_effect");
						memeSprite.setBrush("pov_vamphold_02");
						//memeSprite.Scale = 1.25;
						memeSprite.Visible = true;
					}
					else
					{
						local memeSprite = this.actor.getSprite("pov_head_effect");
						memeSprite.setBrush("pov_vamphold_01");
						//memeSprite.Scale = 1.25;
						memeSprite.Visible = true;
					}
					this.actor.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "]Vamphold[/color]";
				}
				
			}
		}

		// I do the meme
		if (this.actor.getSkills().hasSkill("effects.pov_enemy_mutation_rot"))
		{
			local roll = this.Math.rand(1,100);
			if (roll <= 10)
			{
				this.actor.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "]Farthold[/color]";
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
			b.ActionPoints += 1;
			b.RangedDefense += 3;
			b.RangedSkill += 15;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_colossus"));
			getSkills().add(::new("scripts/skills/perks/perk_underdog"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 150)
					getSkills().add(::new("scripts/skills/perks/perk_legend_muscularity"));
			}

			// Drops
			if (::MSU.isKindOf(this, "unhold_frost") || ::MSU.isKindOf(this, "unhold_frost_armored"))
			{
				this.actor.m.OnDeathLootTable.push([100,"scripts/items/armor_upgrades/named/pov_named_unhold_fur_upgrade"]);
			}
			else
			{
				this.actor.m.OnDeathLootTable.push([100,"scripts/items/armor_upgrades/named/pov_named_bone_platings_upgrade"]);
			}
			
			this.actor.m.OnDeathLootTable.push([1.5,"scripts/items/misc/anatomist/pov_unhold_mutagen_upgrade_item"]);

			setHitpointsPct(1.0);
			return true;
		}
	//}

});