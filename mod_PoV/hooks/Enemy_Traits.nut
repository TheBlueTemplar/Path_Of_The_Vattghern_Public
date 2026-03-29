::TLW.EntityTraits <-
{
	// New Enemy Trait System
	// Currently implemented for humanoid enemies, they can get rando traits!
	add_random_traits = function(_actor)
	{
		// fallbacks
		if (_actor.getAIAgent() == null)
		{
			return;
		}

		//Summoned entities currently CAN have Traits (no issue with me)
		if (_actor.isResurrected()){return;} //Fallback-Fix for enemies getting Trait when rising from dead

		local possiblePositiveTraits = [ // List of all possible Positive Traits
			"pov_pluviophile_trait",
			"strong_trait",
			"tough_trait",
			"dexterous_trait",
			"sure_footing_trait",
			"iron_lungs_trait",
			"iron_jaw_trait",
			"athletic_trait",
			"brute_trait",
			"weasel_trait",
			"huge_trait",
			"legend_aggressive_trait",
			"legend_heavy_trait",
			"legend_martial_trait",
			"legend_unpredictable_trait",
			"legend_pragmatic_trait",
			"legend_steady_hands_trait",
			"swift_trait"
		];	

		local possibleNegativeTraits = [ // List of all possible Negative Traits
			"hesitant_trait",
			"tiny_trait",
			"clumsy_trait",
			//"fat_trait", // some error with getBackground() lmao
			"ailing_trait",
			"bleeder_trait",
			"fragile_trait",
			"asthmatic_trait",
			"clubfooted_trait",
			"fainthearted_trait",
			"paranoid_trait",
			"craven_trait",
			"legend_predictable_trait",
			"legend_light_trait",
			"cocky_trait"
		];	

		local positiveChance = [3, 4, 5, 8][::World.Assets.getCombatDifficulty()];
		local negativeChance = [8, 5, 4, 3][::World.Assets.getCombatDifficulty()];

		// Test(s)
		//positiveChance = 100;
		//negativeChance = 100;

		// Roll a Positive Trait Number
		local roll = this.Math.rand(1.0, 100.0)
		local positiveTrait = possiblePositiveTraits[this.Math.rand(0, possiblePositiveTraits.len() - 1)]
		//::TLW.Mod.Debug.printLog("Rolling for Trait: " + roll + " vs " + positiveChance);

		if (roll <= positiveChance)
		{
			// Apply Positive Trait
			::TLW.Mod.Debug.printLog("Rolled Positive Trait: " + positiveTrait);

			local posTrait = this.new("scripts/skills/traits/" + positiveTrait);
			posTrait.m.Type = ::Const.SkillType.StatusEffect; // Make it Visible in Battle
			posTrait.m.Name = "[color="+ ::Const.UI.Color.povEnemyTraitPositive + "]" + posTrait.m.Name + "[/color]"; // Color to differenciate
			_actor.getSkills().add(posTrait);
			//::TLW.EnemyMut.TraitFactory[Traits](_actor, _hard);
		}

		// Roll a Negative Trait Number
		local roll2 = this.Math.rand(1.0, 100.0)
		local negativeTrait = possibleNegativeTraits[this.Math.rand(0, possibleNegativeTraits.len() - 1)]
		//::TLW.Mod.Debug.printLog("Rolling for Trait: " + roll + " vs " + positiveChance);

		if (roll2 <= negativeChance)
		{
			// Apply Negative Trait
			::TLW.Mod.Debug.printLog("Rolled Negative Trait: " + negativeTrait);

			local negTrait = this.new("scripts/skills/traits/" + negativeTrait);
			negTrait.m.Type = ::Const.SkillType.StatusEffect; // Make it Visible in Battle
			negTrait.m.Name = "[color="+ ::Const.UI.Color.povEnemyTraitNegative + "]" + negTrait.m.Name + "[/color]"; // Color to differenciate
			_actor.getSkills().add(negTrait);
			//::TLW.EnemyMut.TraitFactory[Traits](_actor, _hard);
		}
	}
}