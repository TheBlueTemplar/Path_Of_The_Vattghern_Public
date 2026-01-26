this.pov_seer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.Name = "Old Seer";
		this.m.ID = "background.pov_seer";
		this.m.Icon = "ui/backgrounds/seer_02.png";
		this.m.HiringCost = 2250;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			::Legends.Traits.getID(::Legends.Trait.Athletic),
			::Legends.Traits.getID(::Legends.Trait.Bloodthirsty),
			::Legends.Traits.getID(::Legends.Trait.Brute),
			::Legends.Traits.getID(::Legends.Trait.Dexterous),
			::Legends.Traits.getID(::Legends.Trait.Huge),
			::Legends.Traits.getID(::Legends.Trait.Tough),
			::Legends.Traits.getID(::Legends.Trait.Disloyal),
			::Legends.Traits.getID(::Legends.Trait.Loyal),
			::Legends.Traits.getID(::Legends.Trait.Dumb)
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.MeleeSkill,
			this.Const.Attributes.MeleeDefense,
			this.Const.Attributes.Hitpoints,
		];
		this.m.Titles = [
			"the Enthralling",
			"the Cunning",
			"the White",
			"the Curse Lifter",
			"the Fascinating",
			"the Speaker",
			"the Dreamer",
			"the Clairvoyant",
			"the Diviner",
			"the Conjurer",
			"the Witch",
			"the Soothsayer",
			"the Wise Woman",
			"the Evoker"
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Skinny;

		this.m.BackgroundType = this.Const.BackgroundType.Druid | this.Const.BackgroundType.Educated;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.Level = 3;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[2];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[2];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				::Const.Perks.PolearmTree
			],
			Defense = [
				::Const.Perks.LightArmorTree,
				::Const.Perks.ClothArmorTree
			],
			Traits = [
				::Const.Perks.SturdyTree,
				::Const.Perks.InspirationalTree,
				::Const.Perks.IntelligentTree,
				::Const.Perks.CalmTree,
				::Const.Perks.IndestructibleTree
			],
			Enemy = [],
			Class = [],
			Profession = [
				::Const.Perks.HealerProfessionTree,
			],
			Magic = [
				::Const.Perks.SeerMagicTree,
				::Const.Perks.IllusionistMagicTree,
				::Const.Perks.StavesMagicTree
			]
		};

		this.m.CustomPerkTree = [
			[
				::Legends.Perk.LegendSummonCat,
				::Legends.Perk.CripplingStrikes,
				::Legends.Perk.Recover
			],
			[
				::Legends.Perk.Bullseye,
				::Legends.Perk.BagsAndBelts,
				::Legends.Perk.QuickHands
			],
			[],
			[],
			[
				::Legends.Perk.BattleFlow
			],
			[
				::Legends.Perk.LegendBallistics,
			],
			[],
			[],
			[],
			[],
			[]
		];

	}

	function onBuildDescription()
	{
		//come back to this later NOOO I WONT HAHE
		return "{ Time has bent %name%\'s back and silvered his hair, but it has not taken his will. His eyes remain sharp, weighing men and moments with equal care. There is a sense that he has survived not by chance, but by knowing when to stand firm and when to step aside. | At first glance, %name% appears little more than an old man worn thin by the years. Yet when he speaks, his words carry a certainty that quiets a room. He moves with deliberation, as though the world must wait for him rather than the other way around. | The years have etched deep lines into %name%\'s face, but behind them lies a keen mind and a steady resolve. He watches everything, says little, and seems to know more about the world than he cares to share. Whatever power he possesses, it is tightly held and carefully used. | Though his hands tremble at times, %name%\'s gaze never wavers. He speaks of events long past as if they happened yesterday, and of future dangers as if he has already faced them. Whether by wisdom, magic, or sheer stubbornness, he remains standing where others have fallen. | Few know where %name% comes from, and fewer still dare to ask. He carries himself like a man who has paid dearly for what he knows, and who expects that debt to one day be collected again. Until then, he endures.}";
	}

	function getTooltip()
	{
		local ret = this.character_background.getTooltip();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "Experience gain increased by [color=" + this.Const.UI.Color.PositiveValue + "]8%[/color]."
			}
		);
		return ret;
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-10,
				-5
			],
			Bravery = [
				2,
				4
			],
			Stamina = [
				11,
				15
			],
			MeleeSkill = [
				-5,
				-5
			],
			RangedSkill = [
				7,
				15
			],
			MeleeDefense = [
				-6,
				-3
			],
			RangedDefense = [
				-2,
				2
			],
			Initiative = [
				10,
				15
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		//traits
		::Legends.Traits.grant(this, ::Legends.Trait.Bright);
		::Legends.Traits.grant(this, ::Legends.Trait.Old);	
		//perks
		::Legends.Perks.grant(this, ::Legends.Perk.Student);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendMagicMissile);
	}

	function onAddEquipment()
	{
		//local talents = this.getContainer().getActor().getTalents();
		//talents.resize(this.Const.Attributes.COUNT, 0);
		//talents[this.Const.Attributes.Initiative] = 2;
		//talents[this.Const.Attributes.Fatigue] = 1;
		//this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[1, ::Legends.Armor.Standard.legend_seer_robes]
		]));
		items.equip(this.Const.World.Common.pickHelmet([
			[1, ::Legends.Helmet.Standard.legend_seer_hat]
		]));
		items.equip(this.new("scripts/items/weapons/legend_mystic_staff"));
	}

	function onUpdate(_properties)
	{
		this.character_background.onUpdate(_properties);
		_properties.XPGainMult *= 1.08;
	}
});
