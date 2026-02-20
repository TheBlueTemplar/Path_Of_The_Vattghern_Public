this.pov_named_hyena_fur_upgrade <- ::inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.hyena_fur";
		this.m.NameList = this.Const.Strings.PovDirewolfArmorNames; // same shit pretty much lol
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.Description = "Furs taken from ferocious hyenas, cured and sewn together to be worn as a beast hunter\'s trophy around the neck. Donning the skin of a beast like this bolsters one\'s drive to action.";
		this.m.ArmorDescription = "A mantle of hyena furs has been attached to this armor, which bolsters the wearer\'s drive to action.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_hyena.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_icon_named_upgrade_hyena.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_hyena.png";
		this.m.SpriteFront = "upgrade_26_front";
		this.m.SpriteBack = "upgrade_26_back";
		this.m.SpriteDamagedFront = "upgrade_26_front_damaged";
		this.m.SpriteDamagedBack = "upgrade_26_back";
		this.m.SpriteCorpseFront = "upgrade_26_front_dead";
		this.m.SpriteCorpseBack = "upgrade_26_back_dead";
		this.m.Value = 1500;
		this.m.Condition = 10; // +5 base increase, + bonus
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 3;
		this.m.InitiativeModifier = 15;
		this.m.SpecialValue = 0;
		this.randomizeValues();
	}

	function randomizeValues()
	{
		this.pov_named_armor_upgrade.randomizeValues();
		this.m.StaminaModifier = 3; // to keep that just at 3
	}

});

