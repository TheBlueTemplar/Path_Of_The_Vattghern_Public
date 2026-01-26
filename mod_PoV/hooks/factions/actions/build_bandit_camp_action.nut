::TLW.HooksMod.hook("scripts/factions/actions/build_bandit_camp_action", function ( q ) {

	q.onExecute = @(__original) function( _faction )
	{
		local camp = null;
		local days = this.World.getTime().Days;

		 
		//General idea: Forsaken Settlement starts with a lower chance to appear... 
		//ends up with higher one lategame, up to 25% of bandit settlements
		
		// Forsaken settlement chance:
		// 15% at day 0 -> 30% at day 200 (then capped)
		// + ~4% chance per 50 days
		local hardChance = 15 + (days / 200.0) * 15.0;
		hardChance = this.Math.min(hardChance, 25);
		//hardChance = 75; //test only

		local roll = this.Math.rand(1, 100);

		// Same DLC latitude constraints as vanilla
		local minY = this.Const.DLC.Desert ? 0.2 : 0.0;
		local maxY = this.Const.DLC.Wildmen ? 0.75 : 1.0;

		// ---- Forsaken settlement roll ----
		if (roll <= hardChance)
		{
			local tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries,[
					this.Const.World.TerrainType.Mountains,
					this.Const.World.TerrainType.Snow
				],12, 22,1000,7, 7,null,minY, maxY); // farther = harder

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/pov_bandit_ruins_location",tile.Coords);
			}
		}
		else
		{
			// Vanilla-style equal distribution
			local pick = this.Math.rand(1, 3);

			if (pick == 1)
			{
				local tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries,[
						this.Const.World.TerrainType.Mountains,
						this.Const.World.TerrainType.Snow
					],7, 16, 1000, 7, 7, null, minY, maxY);

				if (tile != null)
					camp = this.World.spawnLocation("scripts/entity/world/locations/bandit_camp_location", tile.Coords);
			}
			else if (pick == 2)
			{
				local tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries,[
						this.Const.World.TerrainType.Mountains,
						this.Const.World.TerrainType.Snow
					],6, 12, 1000, 7, 7, null, minY, maxY);

				if (tile != null)
					camp = this.World.spawnLocation("scripts/entity/world/locations/bandit_hideout_location", tile.Coords);
			}
			else
			{
				local tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries,[
						this.Const.World.TerrainType.Mountains,
						this.Const.World.TerrainType.Snow
					],10, 20, 1000, 7, 7, null, minY, maxY);

				if (tile != null)
					camp = this.World.spawnLocation("scripts/entity/world/locations/bandit_ruins_location", tile.Coords);
			}
		}

		// ---- Finalization (vanilla) ----
		if (camp != null)
		{
			local banner = this.getAppropriateBanner(camp, _faction.getSettlements(), 15, this.Const.BanditBanners);
			camp.onSpawned();
			camp.setBanner(banner);
			_faction.addSettlement(camp, false);
		}
	};
});
