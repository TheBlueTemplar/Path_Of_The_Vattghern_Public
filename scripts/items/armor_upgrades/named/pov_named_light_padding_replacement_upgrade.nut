this.pov_named_light_padding_replacement_upgrade <- ::inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.pov_light_padding_replacement";
		this.m.NameList = this.Const.Strings.PovSpiderArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Silk Padding";
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.Description = "Crafted from exotic materials, this replacement padding can provide the same amount of protection as regular padding at less weight.";
		this.m.ArmorDescription = "This armor has its padding replaced by a lighter but no less durable one.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_spider.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_icon_named_upgrade_spider.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_spider.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_05_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_05_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_05_back_dead";
		this.m.Value = 2000;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.FatiguePenaltyMultiplier = -25.0;
		this.m.SpecialValue = 0;
		this.randomizeValues();
	}

});

