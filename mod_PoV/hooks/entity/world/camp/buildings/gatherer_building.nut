::TLW.HooksMod.hook("scripts/entity/world/camp/buildings/gatherer_building", function( q ) {

	q.getAllLevels = @(__original) function()
	{
		// __original(); // dont call it!
		local map = {
			Brewer = 0,
			Woodsman = 0,
			Miner = 0,
			Apothecary = 0
		};
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			if (bro.getSkills().hasPerk(::Legends.Perk.LegendPotionBrewer))
			{
				map.Brewer += bro.getLevel();
			}

			if (bro.getSkills().hasPerk(::Legends.Perk.LegendSpecialistWoodsman))
			{
				map.Woodsman += bro.getLevel(); // left here just in case lol
			}

			if (bro.getSkills().hasPerk(::Legends.Perk.PovSpecialistWoodsman))
			{
				map.Woodsman += bro.getLevel(); // edit to make it use pov perk instead
			}

			if (bro.getSkills().hasPerk(::Legends.Perk.LegendOreHunter))
			{
				map.Miner += bro.getLevel();
			}

			switch(bro.getBackground().getID())
			{
				case "background.legend_vala":
				case "background.legend_herbalist":
				case "background.legend_alchemist":
				case "background.legend_druid":
				case "background.legend_commander_druid":
					map.Apothecary += bro.getLevel();
			}

			if (bro.getSkills().hasPerk(::Legends.Perk.LegendGatherer))
			{
				map.Apothecary += bro.getLevel();
			}
		}

		return map;
	}

	/*q.getModifiers <- function()
	{
		local ret =
		{
			Consumption = 1.0 / this.m.Conversion,
			Craft = 0.0, // total Craft value of all characters assigned to the tent
			Assigned = 0, // number of characters assigned to the tent
			Modifiers = [] // each element is [Craft value contributed by the character (including bonuses), Name of character, Background of character]
		}
		local roster = this.World.getPlayerRoster().getAll();
		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue
			}
			// Each character assigned will contribute the tent's BaseCraft plus any bonuses from their modifiers
			// If the character does not have the relevant skill, they will contribute only the BaseCraft value
			// If the character is skilled, they will contribute the BaseCraft value + the bonuses from their modifiers. The bonuses are further multiplied by the tent's ModMod value
			// A higher ModMod value means that skilled characters will have a more significant impact on the output
			local mod = this.m.BaseCraft + this.m.BaseCraft * bro.getBackground().getModifiers()[this.m.ModName] * this.m.ModMod;
			local baseMod = bro.getBackground().getModifiers()[this.m.ModName];

			if (bro.getSkills().hasPerk(::Legends.Perk.LegendMedIngredients))
			{
				mod = mod + 0.15; // + 15% Gathering in camp Modifier
			}

			if (bro.getSkills().hasPerk(::Legends.Perk.LegendHerbcraft))
			{
				mod = mod + 0.15; // + 15% Gathering in camp Modifier
			}

			if (bro.getSkills().hasPerk(::Legends.Perk.LegendOreHunter))
			{
				mod = mod + 0.1; // + 10% Gathering in camp Modifier
			}

			++ret.Assigned;
			ret.Modifiers.push([mod, bro.getNameOnly(), bro.getBackground().getNameOnly()]);
		}

		ret.Modifiers.sort(this.sortModifiers);
		for (local i = 0; i < ret.Modifiers.len(); i = ++i)
		{
			ret.Modifiers[i][0] = ret.Modifiers[i][0] * this.Math.pow(i + 1, -0.5); // each additional character grants diminishing returns
			if (this.getUpgraded())
			{
				ret.Modifiers[i][0] *= 1.15; // an upgraded tent grants a 15% bonus to each character's Craft contribution
			}
			ret.Craft += ret.Modifiers[i][0];
		}
		return ret;		
	}
	*/

});

