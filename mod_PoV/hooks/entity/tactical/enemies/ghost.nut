::TLW.HooksMod.hook("scripts/entity/tactical/enemies/ghost", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original()
		
		// Additional Flags
		if (!this.actor.getFlags().has("ghost"))
		this.actor.getFlags().add("ghost")
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Ghost));
	  	}

		// HERE, ADD EFFECTS YOU ALWAYS WANT APPLIED
		//this.m.Skills.add(this.new("scripts/skills/effects/pov_serpentine_agility_effect"));
		
		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// No Mutation For Ghosts Currently

		// Edits of other mods (hooks)
		if (::TLW.hasMC && ::TLW.McTweaks)
		{
			local badThing = this.actor.getSkills().getSkillByID("actives.ghost_possess");
			if (badThing)
			{
				this.actor.getSkills().remove(badThing);
			}
		}

		// I do the meme
		if (this.actor.getSkills().hasSkill("effects.pov_enemy_mutation_hexe"))
		{
			local roll = this.Math.rand(1,100);
			if (roll <= 6)
			{
				this.actor.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "]Rizzlergeist[/color]";
			}
		}

		// I do the meme vol2
		if (this.actor.getSkills().hasSkill("effects.pov_enemy_mutation_rot"))
		{
			local roll = this.Math.rand(1,100);
			if (roll <= 6)
			{
				this.actor.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "]Sheißegeist[/color]";
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
			b.MeleeDefense += 5;
			b.ActionPoints += 1;

			// Bonus Skills
			getSkills().add(::new("scripts/skills/perks/perk_footwork"));
			getSkills().add(::new("scripts/skills/perks/perk_rotation"));
			getSkills().add(::new("scripts/skills/perks/perk_underdog"));
			getSkills().add(::new("scripts/skills/perks/perk_nine_lives"));

			// Bonus Skills (Day-Based)
			if (!::Tactical.State.isScenarioMode()) {
				if (::World.getTime().Days >= 75)
					getSkills().add(::new("scripts/skills/perks/perk_fortified_mind"));
					getSkills().add(::new("scripts/skills/perks/perk_legend_terrifying_visage"));
			}

			// Skills Edits
			local scream = getSkills().getSkillByID("actives.horrific_scream");
			if (scream != null) scream.m.MaxRange = 4;

			// DO SOME VALUE STUFF DROPS
			this.actor.m.OnDeathLootTable.push([100,"scripts/items/loot/signet_ring_item"]);
			this.actor.m.OnDeathLootTable.push([100,"scripts/items/loot/ornate_tome_item"]);

			return true;
		}

		// Works, but damn too OP
		/*
		q.onDeath = @(__original) function( _killer, _skill, _tile, _fatalityType )
		{
			__original(_killer, _skill, _tile, _fatalityType);

			if (!m.IsMiniboss) return
			
			if (_tile == null)
				_tile = getTile();

			local loot, type = ::Math.rand(0, 100);

			if (type <= 25) {
				local weapons = clone ::Const.Items.NamedWeapons;
				loot = ::new("scripts/items/" + ::MSU.Array.rand(weapons));
			}
			else if (type <= 50) {
				local shields = clone ::Const.Items.NamedShields;
				loot = ::new("scripts/items/" + ::MSU.Array.rand(shields));
			}
			else if (type <= 75) {
				local helmets = clone ::Const.Items.NamedHelmets;
				local weightName = ::Const.World.Common.convNameToList(helmets);
				loot = ::Const.World.Common.pickHelmet(weightName);
			}
			else if (type <= 100) {
				local armor = clone ::Const.Items.NamedArmors;
				local weightName = ::Const.World.Common.convNameToList(armor);
				loot = ::Const.World.Common.pickArmor(weightName);
			}

			if (loot != null)
				loot.drop(_tile);
		}
		*/
	//}

});