::TLW.HooksMod.hook("scripts/entity/tactical/actor", function ( q ) {

	// Custom Srprite Layers Addition
	q.onInit = @(__original) function()
	{
		// Original below and must stay there
		// Add a new Sprite Layer
		local self = this;
		local old_addSprite = self.addSprite;
		self.addSprite = function (_layerID)
		{
			/*
			if (_layerID == "socket")
			{
				old_addSprite("pov_random_Bullshit");
			} 
			return old_addSprite(_layerID);
			*/

			// puts shit over these layers
			// if you want to put shit below layers, do the same above without the ret (see commented out example)
			local ret = old_addSprite(_layerID);

			if (_layerID == "socket")
			{
				old_addSprite("pov_back_socket"); // Reserved for mutant effect
				old_addSprite("pov_back_socket2");
				old_addSprite("pov_bust");
			} 
			
			if (_layerID == "head")
			{
				old_addSprite("pov_head_effect");
				//old_addSprite("pov_front_socket");
			}

			//status_rooted (front part, used for Front effects)
			if (_layerID == "status_rooted")
			{
				old_addSprite("pov_front_socket");
			}

			/*if (_layerID == "bust")
			{
				old_addSprite("pov_bust");
			}*/

			return ret;
			//return old_addSprite(_layerID);
		};
		__original();
		//self.addSprite = old_addSprite;

		// If in battle, add special effects ("special skill" - for all entities)
		// This is FOR ENEMY! See player.nut hook for player!
		if (::World.State.getPlayer() != null && this.Tactical.isActive())
		{
			// Balance / Overhaul change. Dont apply when loaded with some mods
			if (!::TLW.hasFOTN)
			{
				this.getSkills().add(this.new("scripts/skills/special/pov_armor_changes_special"));
			}
		}

		// If SSU Tweaks enabled, remove their Armor Encumburance Effect
		if (::TLW.hasSSU && ::TLW.SSUTweaks)
		{
			if (this.getSkills().hasSkill("effects.ptr_armor_fatigue_recovery"))
			{
				this.getSkills().removeByID("effects.ptr_armor_fatigue_recovery");
			}
		}

		// Rain kinda rework
		::Legends.Effects.grant(this, ::Legends.Effect.LegendRain);
	}


	q.onDeath = @(__original) function(_killer, _skill, _tile, _fatalityType)
	{
		// First mutant killed flag
		if(this.getFlags().has("mutant") && !::World.Flags.has("FirstMutantKilledEvent"))
		{
			::World.Flags.add("FirstMutantKilledEvent");
		}

		// Remove New Sprite Layers on entity death
		if (this.hasSprite("pov_back_socket"))
		{
			this.getSprite("pov_back_socket").Visible = false;
		}

		if (this.hasSprite("pov_back_socket2"))
		{
			this.getSprite("pov_back_socket2").Visible = false;
		}

		if (this.hasSprite("pov_head_effect"))
		{
			this.getSprite("pov_head_effect").Visible = false;
		}

		if (this.hasSprite("pov_front_socket"))
		{
			this.getSprite("pov_front_socket").Visible = false;
		}

		__original(_killer, _skill, _tile, _fatalityType);
	}

	// Custom Animations
	q.onRender = @(__original) function()
	{
		__original();

		// Enemy Mutant Effect Animation
		local mutantEffect = this.getSkills().getSkillByID("effects.pov_enemy_mutation_effect");
        if (mutantEffect != null) {
            mutantEffect.triggerRender();
        }
		// Rot Mutation Effect Animation
		local rotEffect = this.getSkills().getSkillByID("effects.pov_enemy_mutation_rot");
        if (rotEffect != null) {
            rotEffect.triggerRender();
        }
        // Stench Effect Animation (Same as above - for specific enemies and player)
		local rotEffect = this.getSkills().getSkillByID("effects.pov_unbearable_stench_passive");
        if (rotEffect != null) {
            rotEffect.triggerRender();
        }
	}
});