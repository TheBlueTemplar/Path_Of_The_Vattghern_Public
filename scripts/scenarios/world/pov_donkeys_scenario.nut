this.pov_donkeys_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.pov_donkeys";
		this.m.Name = "(PoV) Donkeys";
		this.m.Description = "[p=c][img]gfx/ui/events/pov_donkeys_origin.png[/img][/p][p]After much deliberation, you understand that being a stablemaster simply was not your calling. Armed with your wit - and with the few better donkeys you did not sell - you decide to set out into the world.\n\n[color=" + this.Const.UI.Color.povOriginGood + "]Donkey Monster:[/color] Start with an eccentric merchant (your avatar, he must not die), and his 3 trusty donkeys. Donkeys get substantially buffed in this origin (+15% Hp, +10% Damage Resistance, +10% Melee Attack, +10% Resolve, -25% Food Consumed). \n\n[color=" + this.Const.UI.Color.povOriginGood + "]Merchantile:[/color] Peddlers, caravan hands and donkeys will be cheaper to hire and maintain, and you can find more of them. Your experience and trusty \"steeds\" allow for slightly faster map movespeed. You can also find and recruit an exclusive background: caravan guards.\n\n[color=" + this.Const.UI.Color.povOriginBad + "]Not a Warrior:[/color] Any other background will not want to bother joining your bizzare company and thus ask for much more money. You also cannot hire outlaws. You also start with lower tools and ammo.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 40;
		this.m.StartingBusinessReputation = 200;
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.m.StartingBusinessReputation));
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 4; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.improveMood(1.5, "Started a...\"company\"");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"legend_peddler_commander_background"//avatar
		]);
		bros[0].getBackground().m.RawDescription = "{You are not sure how exactly you are going to handle the world like that. But you do have your wit, and some well hooved friends to help you along.}";
		bros[0].setPlaceInFormation(13);
		bros[0].getBaseProperties().Hitpoints += 15;
		bros[0].getBaseProperties().MeleeSkill += 5;
		bros[0].getBaseProperties().RangedSkill += 6;
		bros[0].getBaseProperties().MeleeDefense += 4;
		bros[0].getBaseProperties().RangedDefense += 6;
		bros[0].getSkills().add(this.new("scripts/skills/effects/pov_donkey_mutagen_effect"));
		bros[0].getSkills().add(this.new("scripts/skills/traits/legend_seductive_trait"));
		bros[0].setVeteranPerks(2);
		::Legends.Traits.grant(bros[0], ::Legends.Trait.Player);
		bros[0].getFlags().set("IsPlayerCharacter", true);
		bros[0].getSprite("socket").setBrush("bust_base_caravan");
		bros[0].getSprite("miniboss").setBrush("bust_miniboss_trader");

		bros[1].setStartValuesEx([
			"legend_donkey_background"
		]);
		bros[1].setPlaceInFormation(3);
		bros[1].getBaseProperties().MeleeSkill += 5;
		bros[1].getBaseProperties().RangedDefense += 4;
		bros[1].getBaseProperties().MeleeDefense += 4;
		bros[1].setVeteranPerks(2);

		bros[1].m.Talents = [];
		local talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Hitpoints] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 2;
		talents[this.Const.Attributes.MeleeSkill] = 2;
		bros[1].getSprite("socket").setBrush("bust_base_caravan");

		bros[2].setStartValuesEx([
			"legend_donkey_background"
		]);
		bros[2].setPlaceInFormation(4);
		bros[2].getBaseProperties().MeleeSkill += 5;
		bros[2].getBaseProperties().RangedDefense += 4;
		bros[2].getBaseProperties().MeleeDefense += 4;
		bros[2].setVeteranPerks(2);

		bros[2].m.Talents = [];
		local talents = bros[2].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Hitpoints] = 1;
		talents[this.Const.Attributes.Initiative] = 3;
		talents[this.Const.Attributes.Fatigue] = 2;
		bros[2].getSprite("socket").setBrush("bust_base_caravan");

		bros[3].setStartValuesEx([
			"legend_donkey_background"
		]);
		bros[3].setPlaceInFormation(5);
		bros[3].getBaseProperties().MeleeSkill += 5;
		bros[3].getBaseProperties().RangedDefense += 4;
		bros[3].getBaseProperties().MeleeDefense += 4;
		bros[3].setVeteranPerks(2);

		bros[3].m.Talents = [];
		local talents = bros[3].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Initiative] = 1;
		talents[this.Const.Attributes.MeleeDefense] = 3;
		talents[this.Const.Attributes.Hitpoints] = 2;
		bros[3].getSprite("socket").setBrush("bust_base_caravan");

		// Starting Supplies
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
		// Starting Value/Misc Items
		this.World.Assets.getStash().add(this.new("scripts/items/trade/peat_bricks_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/peat_bricks_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/salt_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/cloth_rolls_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/knife"));
		// Starting Utility
		this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
		// Reputation and Legends flags
		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		// Starting Resource Modifiers
		this.World.Assets.m.Money = this.Math.round(this.World.Assets.m.Money * 2.75);
		this.World.Assets.m.Medicine = this.Math.round(this.World.Assets.m.Medicine * 1.40);
		this.World.Assets.m.ArmorParts = this.Math.round(this.World.Assets.m.ArmorParts * 1.00);
		this.World.Assets.m.Ammo = this.Math.round(this.World.Assets.m.Ammo * 0.60);
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3 && !randomVillage.isSouthern())
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 4), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 4), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.IntroTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.pov_donkeys_intro");
		}, null);
	}

	function onHiredByScenario(bro)
	{
		if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Combat))
		{
			bro.worsenMood(0.5, "Unhappy they will need to do all the fighting");
		}
		else if (!bro.getBackground().isBackgroundType(this.Const.BackgroundType.Combat)) //anyone but combat background
		{
			bro.improveMood(0.5, "Glad to be out of the fighting line");
			bro.getSprite("socket").setBrush("bust_base_caravan");
		}

		if (bro.getBackground().getID() == "background.legend_donkey")
		{
			bro.improveMood(0.5, "HREEEEE-AAAW!");
		}
	}

	function onCombatFinished() //is kill?
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}

	function onUpdateHiringRoster( _roster )
	{
		local bros = _roster.getAll();
		local garbage = [];
		foreach( i, bro in bros )
		{
			if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Outlaw)) //no outlaws
			{
				garbage.push(bro);
			}
		}

		// Peddlerz
		this.addBroToRoster(_roster, "peddler_background", 25);
		this.addBroToRoster(_roster, "peddler_background", 10);
		// extra donkeys
		this.addBroToRoster(_roster, "legend_donkey_background", 50);
		this.addBroToRoster(_roster, "legend_donkey_background", 40);
		this.addBroToRoster(_roster, "legend_donkey_background", 30);
		// caravan hands
		this.addBroToRoster(_roster, "caravan_hand_background", 40);
		this.addBroToRoster(_roster, "caravan_hand_background", 20);
		// caravan guards
		this.addBroToRoster(_roster, "pov_caravan_guard_background", 60);
		this.addBroToRoster(_roster, "pov_caravan_guard_background", 40);
		this.addBroToRoster(_roster, "pov_caravan_guard_background", 20);
		this.addBroToRoster(_roster, "pov_caravan_guard_background", 10);

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

	function onGenerateBro(bro)
	{
		if (bro.getBackground().getID() == "background.peddler" || bro.getBackground().getID() == "background.caravan_hand_background" || bro.getBackground().getID() == "background.legend_donkey" || bro.getBackground().getID() == "pov_caravan_guard_background")
		{
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.70);
			bro.getBaseProperties().DailyWageMult *= 0.70;
			bro.getSkills().update();
		}
		else if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Combat))
		{
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.40);
			bro.getBaseProperties().DailyWageMult *= 1.40;
			bro.getSkills().update();
			local r;
			r = this.Math.rand(0, 5); //randomly assigned mald generator (TM) BRUH XD

			if (r == 0)
			{
				::Legends.Traits.grant(bro, ::Legends.Trait.Disloyal);
			}

			if (r == 1)
			{
				::Legends.Traits.grant(bro, ::Legends.Trait.Greedy);
			}

			if (r == 2)
			{
				::Legends.Traits.grant(bro, ::Legends.Trait.Weasel);
			}

			if (r == 3)
			{
				::Legends.Traits.grant(bro, ::Legends.Trait.LegendSlack);
			}

			if (r == 4)
			{
				::Legends.Traits.grant(bro, ::Legends.Trait.LegendDoubleTongued);
			}

			if (r == 5)
			{
				::Legends.Traits.grant(bro, ::Legends.Trait.Dastard);
			}
		}
		else
		{
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.30);
			bro.getBaseProperties().DailyWageMult *= 1.30;
			bro.getSkills().update();
		}
	}

	function getMovementSpeedMult(){
		return 1.020;
	}

});

