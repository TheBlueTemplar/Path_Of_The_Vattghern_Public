// New System
::TLW.MutatePlayer <-
{
	mutatePlayer = function (_actor, _mutagen)
	{
	// Checks and Fallbacks (some handlged at tog item)

		// Fallback if bro already has that effect
		local mutCheck = this.new(_mutagen.Script);
		if (_actor.getSkills().hasSkill(mutCheck.getID()))
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This bro already has that mutation!"));
			return false;
		}

		// A mutant cannot become a Vattghern (done at tog)

		// Fallback if bro is not a vattghern or mutant, tog excluded
		if (!_actor.getSkills().hasSkill("trait.pov_witcher") && !_actor.getSkills().hasSkill("trait.pov_unstable_mutant") && _mutagen.Name != "Vattghern")
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("Mutations can only be used on Vattgherns or Mutants."));
			return false;
		}

		// If used by Mutant, check if Mutagen is compatible with him (if has weak version)
		// If not, then mutagen is vattghern exclusive
		// Examples include: Mutation Upgrades, Legendary Mutations, Vatg. Exclusive stuff etc.
		if (_actor.getSkills().hasSkill("trait.pov_unstable_mutant") && _mutagen.ScriptWeak == "")
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This mutagen is too powerful or complex for a mutant, only a Vattghern can use it."));
			return false;
		}

		// Check if bro has Anatomist Mutations (or SSU Sequences) 
		// THE DIE IF THEY DO MUEHEH (or just dont use the item)
		// This is more of a fallback, should be handled in ToG
		// Soon, legends will do their own thing with mutations, keep an eye out
		if (_actor.getFlags().getAsInt("ActiveMutations") >= 1)
		{
			if(this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				_actor.getItems().transferToStash(this.World.Assets.getStash());
				_actor.getSkills().onDeath(this.Const.FatalityType.None);
				::Legends.addFallen(_actor, "The Trial of the Grasses reacted horribly with their current mutations.");
				this.World.getPlayerRoster().remove(_actor);
				::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character was killed, as the result of uncontrollable, and incompatible, mutations."));
				return true;
			}else{
				this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
				::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("Vattghern mutations cannot be used togeather with SSU and Vanilla sequences/anatomist effects."));
				return false;
			}
		}

	// Mutation Limit	
		// Ignores Mutation Limit in some mutation cases
		if(_mutagen.Limit == true)
		{
			// Checks For Mutation Limit 
			// Vattghern = 1 + 1 per 7 Lvl, Mutant = 2, Forsaken = 3
			local mutationCount = _actor.getFlags().getAsInt("pov_ActiveMutations");
			local mutationLimit;
			if (_actor.getSkills().hasSkill("trait.pov_witcher") || _mutagen.Name == "Vattghern")
			{
				mutationLimit = 1 + this.Math.floor(_actor.getLevel()/7);
			}
			else if(_actor.getSkills().hasSkill("trait.pov_unstable_mutant"))
			{
				if (actor.getFlags().has("playerMutantPlus"))
				{
					mutationLimit = 3;
				}else
				{
					mutationLimit = 2;	
				}
							
			}

			// limit + 1 if has the stabilized mutations perk
			if (_actor.getSkills().hasPerk(::Legends.Perk.PovStabilizedMutations))
			{
				mutationLimit += 1;
			}

			// Debug - Testing
			//mutationLimit = 999;

			// loop over all mutations defined in ::TLW.PlayerMutation
		    foreach (key, mut in ::TLW.PlayerMutation)
		    {
		        // skip ones that count toward the limit
		        if (mut.Limit) continue;

		        // if actor has the skill from this mutation, subtract 1
		        local script = this.new(mut.Script);
		        if (_actor.getSkills().hasSkill(script.getID()))
		        {
		            mutationCount -= 1;
		        }
		    }
			
			// Fallback
			if (mutationCount < 0){mutationCount = 0;}

			if (mutationCount >= mutationLimit)
			{
				// Should play a sound and not use the item
				this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
				::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot currently use any more normal mutations."));
				return false;
			}
		}

	// Mutation Upgrades

		// Mutant cannot use mutation Upgrades! (handled above)
		// If "Remove" has sth, then, well, remove this effect
		// Used for mutation upgrades (they remove old effect)
		if (_mutagen.Remove != "" && _actor.getSkills().getSkillByID(_mutagen.Remove))
		{
			local oldSkill = _actor.getSkills().getSkillByID(_mutagen.Remove);
			_actor.getSkills().remove(oldSkill);
		} else if (_mutagen.Remove != "") 
		{
			// If this is a mutation upgrade, but wrongly used, return false
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("Cannot use this upgrade on a bro without its base mutation effect."));
			return false;
		}
		
	// On Successful Requirements...

		// Add Mutation Effect
		// Mutant gets weak version, other get normal one
		// There is no fallback for the effect here, its before this function is called! (huh?)
		if (_actor.getSkills().hasSkill("trait.pov_unstable_mutant"))
		{
			_actor.getSkills().add(this.new(_mutagen.ScriptWeak));
		}
		else
		{
			_actor.getSkills().add(this.new(_mutagen.Script));
		}
		

	// Add Conditional, Additional Effects
		if (_mutagen.Name == "Ghost")
		{
			if (_actor.getSkills().getSkillByID("perk.fearsome") == null)
			{
				_actor.getBackground().addPerk(this.Const.Perks.PerkDefs.Fearsome, 0, false);
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_fearsome"));
			}else{
				//_actor.getSkills().add(this.new("scripts/skills/effects/gheist_resolve_bonus_effect"));
				_actor.getBaseProperties().Bravery += 10;
			}
		}

	// Play relevant Sounds
		if (_mutagen.Sounds.len() != null)
		{
			for (local i = 0; i <= (_mutagen.Sounds.len() - 1); i++)
			{
				// Fallback, REQUIRED (For Some Reason)
				if (_mutagen.Sounds[i] != null)
				{
					this.Sound.play(_mutagen.Sounds[i], this.Const.Sound.Volume.Inventory);
				}
			}
		}

	// Add Mutation Sickness
		if (_actor.getSkills().hasSkill("injury.pov_sickness2"))
		{
			_actor.getSkills().getSkillByID("injury.pov_sickness2").addHealingTime(this.Math.rand(1, 3));
		}
		else
		{
			_actor.getSkills().add(this.new("scripts/skills/injury/pov_sickness2_injury"));
		}

		// As a bro gets more mutations, sickness lasts for less. But lasts long initially
		// Base additional durations: Vattghern -> 7 , Mutant -> 3
		if (_actor.getSkills().hasSkill("trait.pov_witcher"))
		{
			// less mutation time if has stabilized perk
			if (_actor.getSkills().hasPerk(::Legends.Perk.PovStabilizedMutations))
			{
				_actor.getSkills().getSkillByID("injury.pov_sickness2").addHealingTime(4 - _actor.getFlags().getAsInt("pov_ActiveMutations"));
			}
			else
			{
				_actor.getSkills().getSkillByID("injury.pov_sickness2").addHealingTime(7 - _actor.getFlags().getAsInt("pov_ActiveMutations"));
			}
		}
		else if (_actor.getSkills().hasSkill("trait.pov_unstable_mutant"))
		{
			_actor.getSkills().getSkillByID("injury.pov_sickness2").addHealingTime(3 - _actor.getFlags().getAsInt("pov_ActiveMutations"));
		}
		else if (_mutagen.Name == "Vattghern")
		{
			// necessary, as when using tog, bro doesnt have the witcher trait yet
			_actor.getSkills().getSkillByID("injury.pov_sickness2").addHealingTime(7 - _actor.getFlags().getAsInt("pov_ActiveMutations"));
		}
		

	// Idk wth that does
		local time = 0.0;
		if (("State" in this.World) && this.World.State != null && this.World.State.getCombatStartTime() != 0)
		{
			time = this.World.State.getCombatStartTime();
		}
		else
		{
			time = this.Time.getVirtualTimeF();
		}

	// Party Mood
		// Set a chance for team mood drop with mid - low resolve - Special cases for: anatomis, and fear/hate mutants trait
		// Cannot get mood drop if you have more than 50 resolve
		local brothers = this.World.getPlayerRoster().getAll();
		local chance = 30;
		if (_mutagen.Name != "Vattghern")
		{
			foreach( bro in brothers )
			{
				if(bro.getBackground().getID() == "background.anatomist")
				{
					bro.improveMood(0.5, "Witnessesed a mutation!");
				}
				else if(bro.getSkills().hasSkill("trait.pov_hate_mutants") || bro.getSkills().hasSkill("trait.pov_fear_mutants"))
				{
					bro.worsenMood(0.5, "Do we really need mutants in our company?");
				}
				else if(bro.getCurrentProperties().getBravery() < 50 && this.Math.rand(1, 100) <= chance && !bro.getSkills().hasSkill("trait.pov_witcher") && !bro.getSkills().hasSkill("trait.pov_unstable_mutant")) 
				{
					bro.worsenMood(0.5, "Unsettled by a mutation");
				}
			}
		}

	// Set actor flags
		_actor.getFlags().increment("pov_ActiveMutations")
		_actor.getFlags().set("PotionLastUsed", time);
		_actor.getFlags().increment("PotionsUsed", 1);

	// Finishes the mutation, item is consumed
		// VATTGHERN PERK GROUP ADDITION
		if (_mutagen.Name == "Vattghern")
		{
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This bro successfully became a vattghern. The company is left horrified though, and your new vattghern will need time to recover, maybe some treatment would help (He also unlocks new perks)..."));

			_actor.getBackground().addPerkGroup(this.Const.Perks.VattghernMagicTree.Tree);
		}
		return true;
	}
}

