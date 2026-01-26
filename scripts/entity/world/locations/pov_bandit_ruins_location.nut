this.pov_bandit_ruins_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "The tragic fate of this fortress was to be occupied by unnatural beings, who have lost all their sanity and humanity.";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.pov_bandit_ruins";
		this.m.LocationType = this.Const.World.LocationType.Lair;
		this.m.CombatLocation.Template[0] = "tactical.ruins";
		this.m.CombatLocation.Template[1] = "tactical.human_camp";
		this.m.CombatLocation.Fortification = this.Const.Tactical.FortificationType.WallsAndPalisade; // Always Fortified	
		this.m.CombatLocation.CutDownTrees = true;
		this.m.IsShowingDefenders = false;
		this.m.IsShowingBanner = false;
		// 80% Forsaken, 20% Normal Bandits
		local r = this.Math.rand(1, 100);
		if (r <= 80)
		{
			this.setDefenderSpawnList(this.Const.World.Spawn.PovForsaken);
		}
		else
		{
			this.setDefenderSpawnList(this.Const.World.Spawn.BanditDefenders);			
		}
		this.m.Resources = 180;	
		this.m.NamedShieldsList = this.Const.Items.NamedBanditShields; // idk why this is here xd
	}

	function onSpawned()
	{
		this.m.Name = this.World.EntityManager.getUniqueLocationName(this.Const.World.LocationNames.PovForsakenFort);
		this.location.onSpawned();
	}

	function onDropLootForPlayer( _lootTable )
	{
		this.location.onDropLootForPlayer(_lootTable);
		this.dropMoney(this.Math.rand(115, 330), _lootTable);
		this.dropArmorParts(this.Math.rand(10, 30), _lootTable);
		this.dropAmmo(this.Math.rand(0, 45), _lootTable);
		this.dropMedicine(this.Math.rand(0, 4), _lootTable);
		local treasure = [
			"loot/signet_ring_item",
			"trade/amber_shards_item",
			"trade/cloth_rolls_item",
			"trade/salt_item"
		];

		if (this.Const.DLC.Unhold)
		{
			treasure.extend(treasure);
			treasure.extend(treasure);
			treasure.extend(treasure);
			treasure.extend(treasure);

			treasure.push("legend_armor/armor_upgrades/legend_metal_plating_upgrade");
			treasure.push("legend_armor/armor_upgrades/legend_metal_pauldrons_upgrade");
			treasure.push("legend_armor/armor_upgrades/legend_mail_patch_upgrade");
			treasure.push("legend_armor/armor_upgrades/legend_leather_shoulderguards_upgrade");
			treasure.push("legend_armor/armor_upgrades/legend_leather_neckguard_upgrade");
			treasure.push("legend_armor/armor_upgrades/legend_joint_cover_upgrade");
			treasure.push("legend_armor/armor_upgrades/legend_double_mail_upgrade");
		}

		this.dropFood(this.Math.rand(1, 3), [
			"bread_item",
			"beer_item",
			"dried_fruits_item",
			"ground_grains_item",
			"roots_and_berries_item",
			"pickled_mushrooms_item",
			"smoked_ham_item",
			"cured_venison_item",
			"goat_cheese_item"
		], _lootTable);
		this.dropTreasure(1, treasure, _lootTable);
	}

	function onInit()
	{
		this.location.onInit();
		local body = this.addSprite("body");
		body.setBrush("pov_ruins_forsaken");
	}

});

