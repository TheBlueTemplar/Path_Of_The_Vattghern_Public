::TLW.HooksMod.hook("scripts/factions/actions/send_bandit_ambushers_action", function ( q ) {

	q.onExecute = @(__original) function( _faction )
	{
		local settlements = [];

		foreach( s in _faction.getSettlements() )
		{
			if (s.getResources() == 0)
			{
				continue;
			}

			// Prevent patrols on camps that are marked by contracts
			if (s.getLastSpawnTime() + this.m.timeBetweenSpawnsPerSettlement > this.Time.getVirtualTimeF() || s.getFlags().get("isContractLocation"))
			{
				continue;
			}

			local activeContract = this.World.Contracts.getActiveContract();
			if (activeContract != null && "Destination" in activeContract.m && activeContract.m.Destination == s)
			{
				continue;
			}

			settlements.push({
				D = s,
				P = 10
			});
		}

		local settlement = this.pickWeightedRandom(settlements);

		// --- Legends scaling ---
		local mult = this.World.FactionManager.isCivilWar() ? 1.1 : 1.0;

		if (::Legends.isLegendaryDifficulty())
		{
			mult = this.World.FactionManager.isCivilWar() ? 1.2 : 1.0;
		}

		local distanceToNextSettlement = this.getDistanceToSettlements(settlement.getTile());

		if (::Legends.Mod.ModSettings.getSetting("DistanceScaling").getValue() && distanceToNextSettlement > 14)
		{
			mult *= distanceToNextSettlement / 14;
		}

		// Mark settlement as having spawned now
		settlement.setLastSpawnTimeToNow();

		// In General: 
		//	Day 50 -> Forsaken: 13, Mercs -> 7, Brigands -> 80
		//  Day 100 -> Forsaken 17, Mercs -> 9, Brigands -> 74
		//  Day 150 -> Forsaken 21, Mercs -> 12, Brigands -> 67
		//  Day 200 -> Forsaken 25, Mercs -> 15, Brigands -> 60

		// --- Forsaken chance scaling ---
		// Chance starts at 10, scales up to 25 at day 200.
		local spawnRoll = this.Math.rand(1, 100);
		local scale = 10;

		if (this.World.getTime().Days >= 50)
		{
			scale += 3;

			if (this.World.getTime().Days >= 100)
			{
				scale += 4;

				if (this.World.getTime().Days >= 150)
				{
					scale += 4;

					if (this.World.getTime().Days >= 200)
					{
						scale += 4;
					}
				}
			}
		}

		// --- Enemy Mercs chance scaling ---
		// Chance starts at 5, scales up to 15 at day 200.
		local scale2 = 5;
		if (this.World.getTime().Days >= 50)
		{
			scale2 += 2;

			if (this.World.getTime().Days >= 100)
			{
				scale2 += 2;

				if (this.World.getTime().Days >= 150)
				{
					scale2 += 3;

					if (this.World.getTime().Days >= 200)
					{
						scale2 += 3;
					}
				}
			}
		}

		// give a small breathing room (extremely low chance instead of 0) 
		if (this.World.getTime().Days <= 10)
		{
			scale = 2;
			scale2 = 1;
		}

		//scale += 50; // test
		//scale2 += 50; // test

		local party;

		if (spawnRoll <= scale)
		{
			party = this.getFaction().spawnEntity(
				settlement.getTile(),
				"Forsaken",
				false,
				this.Const.World.Spawn.PovForsaken,
				(this.Math.rand(60, 90) + scale * 2) * this.getScaledDifficultyMult() * mult
			);
			party.getSprite("banner").setBrush(settlement.getBanner());
			party.setFootprintType(this.Const.World.FootprintsType.Brigands);
			party.getFlags().set("IsRandomlySpawned", true);
			party.setDescription("Dangerous Outlaws that have lost their sanity to overwhelming mutations, they are barely human now.");
			// slightly increased loot for forsaken
			party.getLoot().Money = this.Math.rand(55, 220);
			party.getLoot().ArmorParts = this.Math.rand(1, 11);
			party.getLoot().Medicine = this.Math.rand(0, 3);
			party.getLoot().Ammo = this.Math.rand(0, 22);
		}
		// second roll 
		else if (spawnRoll <= scale + scale2)
		{
			party = this.getFaction().spawnEntity(
				settlement.getTile(),
				//"Rogue Mercenary Company",
				this.Const.Strings.MercenaryCompanyNames[this.Math.rand(0, this.Const.Strings.MercenaryCompanyNames.len() - 1)],
				false,
				this.Const.World.Spawn.HostileMercenaries,
				(this.Math.rand(60, 90) + scale2 * 2) * this.getScaledDifficultyMult() * mult
			);
			party.getSprite("banner").setBrush(settlement.getBanner());
			party.setFootprintType(this.Const.World.FootprintsType.Brigands);
			party.getFlags().set("IsRandomlySpawned", true);
			party.setDescription("A Mercenary company that has gone rogue, and is preying on the weak.");
			// Increased loot for merc comps
			party.getLoot().Money = this.Math.rand(55, 225);
			party.getLoot().ArmorParts = this.Math.rand(2, 11);
			party.getLoot().Medicine = this.Math.rand(1, 3);
			party.getLoot().Ammo = this.Math.rand(2, 22);
		}
		else
		{
			party = this.getFaction().spawnEntity(
				settlement.getTile(),
				"Brigands",
				false,
				this.Const.World.Spawn.BanditRaiders,
				this.Math.rand(75, 120) * this.getScaledDifficultyMult() * mult
			);
			party.getSprite("banner").setBrush(settlement.getBanner());
			party.setFootprintType(this.Const.World.FootprintsType.Brigands);
			party.getFlags().set("IsRandomlySpawned", true);
			party.setDescription("A rough and tough band of raiders preying on the weak.");

			party.getLoot().Money = this.Math.rand(50, 200);
			party.getLoot().ArmorParts = this.Math.rand(0, 10);
			party.getLoot().Medicine = this.Math.rand(0, 2);
			party.getLoot().Ammo = this.Math.rand(0, 20);
		}

		local roll = this.Math.rand(1, 6);

		if (roll == 1)
		{
			party.addToInventory("supplies/bread_item");
		}
		else if (roll == 2)
		{
			party.addToInventory("supplies/roots_and_berries_item");
		}
		else if (roll == 3)
		{
			party.addToInventory("supplies/dried_fruits_item");
		}
		else if (roll == 4)
		{
			party.addToInventory("supplies/ground_grains_item");
		}
		else if (roll == 5)
		{
			party.addToInventory("supplies/pickled_mushrooms_item");
		}

		local c = party.getController();
		local ambush = this.new("scripts/ai/world/orders/ambush_order");
		local move = this.new("scripts/ai/world/orders/move_order");
		move.setDestination(settlement.getTile());
		local despawn = this.new("scripts/ai/world/orders/despawn_order");

		c.addOrder(ambush);
		c.addOrder(move);
		c.addOrder(despawn);

		return true;
	};	
});
