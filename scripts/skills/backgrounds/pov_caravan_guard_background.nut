this.pov_caravan_guard_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		// yolo
		this.character_background.create();
		this.m.ID = "background.pov_caravan_guard";
		this.m.Name = "Caravan Guard";
		this.m.Icon = "ui/backgrounds/pov_caravan_guard_background.png";
		this.m.BackgroundDescription = "Caravan guards are used to long and exhausting travels, and can put up a fight too!";
		this.m.GoodEnding = "%name% the once-caravan guard retired from fighting. He used his mercenary money to start a trade-guarding business that specializes in transporting goods through dangerous lands.";
		this.m.BadEnding = "%name% the caravan guard retired back into guarding trade wagons. He died when defending against an ambush by brigands. They took his shirt and left his body in a ditch.";
		this.m.HiringCost = 125;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			::Legends.Traits.getID(::Legends.Trait.FearBeasts),
			::Legends.Traits.getID(::Legends.Trait.Ailing),
			::Legends.Traits.getID(::Legends.Trait.NightBlind),
			::Legends.Traits.getID(::Legends.Trait.Clumsy),
			::Legends.Traits.getID(::Legends.Trait.Dastard),
			::Legends.Traits.getID(::Legends.Trait.LegendLight),
			::Legends.Traits.getID(::Legends.Trait.LegendSeductive),
			::Legends.Traits.getID(::Legends.Trait.Clubfooted),
			::Legends.Traits.getID(::Legends.Trait.Gluttonous),
			::Legends.Traits.getID(::Legends.Trait.Asthmatic),
			::Legends.Traits.getID(::Legends.Trait.Fat),
			::Legends.Traits.getID(::Legends.Trait.LegendUnpredictable),
			"trait.pov_nyctophobia"
		];
		this.m.Titles = [
			"the Guard",
			"the Roadwarden"
		];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Untidy;

		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Notorious;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = this.Math.rand(1, 3);
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Lowborn;

		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[2];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		//this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		//this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		//this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		//this.m.Modifiers.Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[1];
		//this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[3];
		this.m.Modifiers.Terrain = [
			0.0, // ?
			0.0, //ocean
			0.015,//plains
			0.020, //swamp
			0.010, //hills
			0.010, //forest
			0.010, //forest
			0.010, //forest_leaves
			0.010, //autumn_forest
			0.005, //mountains
			0.0, // ?
			0.010, //farmland
			0.005, // snow
			0.010, // badlands
			0.010, //highlands
			0.015, //stepps
			0.0, //ocean
			0.010, //desert
			0.005 //oasis
		];
		this.m.PerkTreeDynamicMins.Defense = 2;
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SwordTree,
				this.Const.Perks.SpearTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.ShieldTree,
				this.Const.Perks.CrossbowTree,
				this.Const.Perks.PolearmTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.OrganisedTree,
				this.Const.Perks.FitTree,
				this.Const.Perks.LargeTree
			],
			Enemy = [],
			Class = [],// maybe add "mutant" class, with bonuses here and there?
			Magic = []
		}
	}

	//Default Male
	function setGender(_gender = -1)
	{
		if (_gender == -1) _gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 1);

		if (_gender != 1) return;
		//this.m.Ethnicity = this.Math.rand(0, 2);
		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.addBackgroundType(this.Const.BackgroundType.Female);
	}

	function onBuildDescription()
	{
		return "{Always the adventurous type, %name% was easily drawn to the life of a caravan hand. | Orphaned by war and pestilence, %name% grew up under the wings of a traveling merchant. | A caravan hand\'s life is tough, but %name% could hardly stand staying in one place for too long. | Though the work is dangerous, being a caravan hand allowed %name% to see the world. | When his family and obligations were destroyed by fire, %name% saw no reason not to join a passing caravan. | Hardy and resolute, %name% was the first chosen by a merchant to protect his stock as a caravan hand. | Running away from home, it didn\'t take long for %name% to join and eventually work for a caravan.} {But the trader he worked for turned out to be abusive, nary a whip away from being a slave driver. After an intense argument with the woman, %name% thought it better to leave before he did something awful. | One day, goods went missing and the hand was blamed for it, promptly ending his time with the caravan. | But a caravan needs protection for a reason, and an ambush by brigands proved why. %name% barely made it out alive. | Years on the road went without a hitch until a new caravan master refused to pay %name%. With just one hand the caravanner punched his boss and grabbed his wages. He used both legs to run, though. | Caravans are frequently tense places to be. One fateful evening, in a dispute over gambling debts, he stove in the head of another traveler. Fearing retribution, %name% was gone before morning. | Sadly, with the expanding war the caravan\'s profits were marginal. %name% was let go as the merchants retired their wagons. | After seeing the foul work of beasts on a fellow caravan, it didn\'t take long for %name% to figure out his wages didn\'t quite meet the level of threats around him. | But war deprived the caravan of stock and soon its driver took to selling slaves. Appalled, %name% freed as many as he could before leaving for good. | Sadly, his caravan began to sell human chattel. While the profits were enormous, it garnered the attention of a local militia - and their pitchforks. One ambush later and %name% was running for his life.} {Now uncertain of what to do, he seeks any opportunity that might come by. | A man like %name% is no stranger to danger, making him a good fit for any mercenary group. | With his caravan days behind him, working as a sellsword was just another avenue for adventure and profit. | In %name%\'s mind, being a mercenary is a lot like being a caravanner. Just better paid. | Well versed to traveling, %name% seems like a natural fit to the tasks already befit for a mercenary. | Years of road travel have molded %name% into quite the durable figure. Any group of mercenaries could use more men like him.}";
	}

	function onChangeAttributes()
	{
		/* Base values are:
		Hp 		50 - 60
		Res 	30 - 40
		Fat 	90 - 100
		Msk 	47 - 57
		Rsk 	32 - 42
		Mdf 	0  - 5
		Rdf 	0  - 5
		Ini 	100 - 110 

		Values below are additions/substractions
		*/
		local c = {
			Hitpoints = [
				10,
				14
			],
			Bravery = [
				4,
				8
			],
			Stamina = [
				8,
				14
			],
			MeleeSkill = [
				4,
				9
			],
			RangedSkill = [
				8,
				12
			],
			MeleeDefense = [
				3,
				6
			],
			RangedDefense = [
				3,
				5
			],
			Initiative = [
				3,
				6
			]
		};
		return c;
	}

	function onAdded() 
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");
		local body = actor.getSprite("body");
		local head = actor.getSprite("head");

		// Scar 'em up hehe (low chance)
		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;	
		}
		
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		// Equipment (Weapons, Shields)
		// 28% xbow, 14% thrown. 28% melee 1h, 14% Melee 2h, 14% melee Polearm
		// In general: 43% ranged, 57% Melee 
		// Also gets a knife at bag
		r = this.Math.rand(0, 6);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/legend_militia_glaive"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/goedendag"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/falchion"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/hand_axe"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/throwing_axe"));
		}
		else if (r == 5 || r == 6)
		{
			items.equip(this.new("scripts/items/weapons/crossbow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}

		items.addToBag(this.new("scripts/items/weapons/knife"));

		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "caravan_guard_armor_01", helmet = "caravan_guard_helmet_01" }
		];

		local r = this.Math.rand(0, equipmentSets.len() - 1);
		local selectedSet = equipmentSets[r];
		items.equip(this.Const.World.Common.pickArmor([[ 1, selectedSet.armor ]]));
		items.equip(this.Const.World.Common.pickHelmet([[ 1, selectedSet.helmet ]]));
	}

	function getTooltip()
	{
		local ret = this.character_background.getTooltip();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "The fatigue and initiative penalty from wearing armor is decreased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done against outlaws increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]."
			}
		);
		return ret;
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();

		local bodyitem = actor.getBodyItem();

		if (bodyitem == null)
		{
			return 0;
		}
	
		local armorFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Body);
		local helmetFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Head);
		local totalPen = armorFatPen + helmetFatPen;
		local penalty = totalPen * 0.10;
		return -1 * penalty; // well its a bonus here DUH
	}

	function onUpdate(_properties)
	{
		this.character_background.onUpdate(_properties);
		_properties.Stamina += this.getBonus();
		_properties.Initiative += this.getBonus();
	}

	function onAnySkillUsed(_skill, _targetEntity, _properties)
	{
		this.character_background.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null)
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Bandits)
			{
				_properties.DamageTotalMult *= 1.05;
			}
		}	
	}

});
