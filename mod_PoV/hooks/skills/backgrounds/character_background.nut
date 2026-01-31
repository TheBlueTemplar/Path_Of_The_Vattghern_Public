::TLW.HooksMod.hook("scripts/skills/backgrounds/character_background", function(q)
{
	// Here Im editing modifiers. MORE HOOKS OF OTHER FUNCS FURTHER DOWN

	// Super hacky, but it works
	// This is a way to (kinda) dynamically change bro's camp tent modifiers
	// Changes both actual value and whatever is shown on tooltip
	// onAdded of a characters background has to be called in the respective perk, and grant the same buff, for this to work immediately.
	// Check PoV's perk_legend_med_ingredients.nut hook for example
	q.onAdded = @(__original) function ()
	{
		__original();

		// COMPAT - EDITS
		if (!::TLW.hasFOTN)
		{	
		// Skills below can be Perks/Traits currently
		// CAMP MODIFIERS
			// GATHERING
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendMedIngredients))
			{
				this.m.Modifiers.Gathering += 0.10;
			}

			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendMedPackages))
			{
				this.m.Modifiers.Gathering += 0.15;
			}

			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendMealPreperation))
			{
				this.m.Modifiers.Gathering += 0.10;
			}

			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendOreHunter))
			{
				this.m.Modifiers.Gathering += 0.10;
			}

			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendWoodworking))
			{
				this.m.Modifiers.Gathering += 0.10;
			}
				// Gathering + Healing
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendHerbcraft))
			{
				this.m.Modifiers.Gathering += 0.10;
				this.m.Modifiers.Healing += 0.10;
			}

			// HEALING / INJURY
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendSpecBandage))
			{
				this.m.Modifiers.Healing += 0.10;
				this.m.Modifiers.Injury += 0.03;
			}

			// CRAFTING
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendCampCook))
			{
				this.m.Modifiers.Crafting += 0.10;
			}

			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendAlcoholBrewing))
			{
				this.m.Modifiers.Crafting += 0.15;
			}

			// SCOUTING
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendSummonFalcon))
			{
				this.m.Modifiers.Scout += 0.10;
			}

		// WORLD MOVE SPEED MODIFIERS
			// has to be this.m.Modifiers.Terrain[x], where x can be from 0 to 18
			// terrain in order (dont use ?): 0-?, 1-ocean, 2-plains, 3-swamp, 4-hills, 5/6/7/8-forest,
			// 9-mountains, 10-?, 11-farmland, 12-snow, 13-badlands, 14-highlands, 15-steppes,
			// 16-ocean, 17-desert, 18-oasis
			// Example values: +0.005 = +0.5%, +0.01 = +1%, +0.25 = +25%...
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.Pathfinder))
			{
				// typical "difficult terrain" combo, add 1,2,11,14,15,16,18 for "all terrain"
				this.m.Modifiers.Terrain[3] += 0.0075;
				this.m.Modifiers.Terrain[4] += 0.0075;
				this.m.Modifiers.Terrain[5] += 0.0075;
				this.m.Modifiers.Terrain[6] += 0.0075;
				this.m.Modifiers.Terrain[7] += 0.0075;
				this.m.Modifiers.Terrain[8] += 0.0075;
				this.m.Modifiers.Terrain[9] += 0.0075;
				this.m.Modifiers.Terrain[12] += 0.0075;
				this.m.Modifiers.Terrain[13] += 0.0075;
				this.m.Modifiers.Terrain[17] += 0.0075;
			}

		// STASH SIZE MODIFIERS
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.BagsAndBelts))
			{
				this.m.Modifiers.Stash += 4;
			}

		// BARTER MODIFIERS
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendMinnesanger))
			{
				this.m.Modifiers.Barter += 0.0075;
			}

			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.LegendSpecialistMusician))
			{
				this.m.Modifiers.Barter += 0.0075;
			}
		}

		// POV ADDITIONS - ALWAYS APPLY
		// CAMP MODIFIERS
			// GATHERING
			if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.PovChampionSlayer))
			{
				this.m.Modifiers.Training += 0.20;
			}
	}
});
