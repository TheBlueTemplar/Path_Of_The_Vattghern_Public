this.pov_named_armor_redback_cloak_upgrade <- this.inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.pov_redback_cloak";
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.NameList = this.Const.Strings.PovSpiderArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		this.m.Description = "This flowing cloak is made from the finest spider web, and offers excellent protection against ranged attacks.";
		this.m.ArmorDescription = "A cloak of spider silk offers extra protection";
		this.m.SpriteBack = "pov_cloak_spider";
		this.m.SpriteDamagedBack = "pov_cloak_spider_damaged";
		this.m.SpriteCorpseBack = "pov_cloak_spider_dead";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_cloak_black.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_named_upgrade_cloak_black.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_cloak_black.png";
		this.m.Value = 10000;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.SpecialValue = 25; // ranged def.
		this.m.StaminaModifier = -3;
		this.randomizeValues();
	}

	function randomizeValues()
	{
		this.pov_named_armor_upgrade.randomizeValues();
		this.m.SpecialValue = ::Math.min(50, ::Math.ceil(this.m.SpecialValue * ::Math.rand(110, 140) * 0.01));
	}

	function getTooltip()
	{
		local result = this.pov_named_armor_upgrade.getTooltip();
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=" + ::Const.UI.Color.NegativeValue + "]-" + this.m.SpecialValue + "%[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=" + ::Const.UI.Color.NegativeValue + "]-" + this.m.SpecialValue + "%[/color]"
		});
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart != ::Const.BodyPart.Body)
		{
			return;
		}

		_properties.DamageReceivedRangedMult *= 1.0 - (this.m.SpecialValue * 0.01);
	}

});
