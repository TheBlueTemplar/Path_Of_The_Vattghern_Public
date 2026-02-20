this.pov_named_white_direwolf_pelt_upgrade <- ::inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.pov_named_white_direwolf_pelt";
		this.m.NameList = this.Const.Strings.PovDirewolfArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.Description = "Pelt taken from the most dangerous of the Legendary White Wolves. Donning the skin of a beast like this signals that one is a legendary warrior.";
		this.m.ArmorDescription = "A mantle of a legendary white wolf has been attached to this armor, which transforms the wearer into an imposing figure.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_white_direwolf.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_icon_named_upgrade_white_direwolf.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_white_direwolf.png";
		this.m.SpriteFront = "upgrade_white_wolf_front";
		this.m.SpriteBack = "upgrade_white_wolf_back";
		this.m.SpriteDamagedFront = "upgrade_white_wolf_front_damaged";
		this.m.SpriteDamagedBack = "upgrade_white_wolf_back";
		this.m.SpriteCorpseFront = "upgrade_white_wolf_front_dead";
		this.m.SpriteCorpseBack = "upgrade_white_wolf_back_dead";

		this.m.Value = 7500;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -2;
		this.m.SpecialValue = 0; // extra pov bs hehe hoo hah
		this.m.ThreatModifier = 15;
		this.randomizeValues();
	}

});

