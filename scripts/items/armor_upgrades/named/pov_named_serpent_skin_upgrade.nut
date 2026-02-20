this.pov_named_serpent_skin_upgrade <- ::inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.pov_serpent_skin";
		this.m.NameList = this.Const.Strings.PovSerpentArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Skin Mantle";
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.Description = "A mantle crafted from the thin and shimmering scales of desert serpents, especially resistant to heat and flames.";
		this.m.ArmorDescription = "A mantle of serpent skin has been attached to this armor, which makes it more resistant to heat and flames.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_serpent.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_icon_named_upgrade_serpent.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_serpent.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_27_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_27_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_27_back_dead";
		this.m.Value = 1500;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
		this.m.InitiativeModifier = 10;
		this.m.SpecialValue = 0;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.pov_named_armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces damage from fire and firearms by [color=" + ::Const.UI.Color.NegativeValue + "]33%[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces damage from fire and firearms by [color=" + ::Const.UI.Color.NegativeValue + "]33%[/color]"
		});
	}

	function onEquip()
	{
		this.item.onEquip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getSkills().add(::new("scripts/skills/items/firearms_resistance_skill"));
		}
	}

	function onUnequip()
	{
		this.item.onUnequip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getSkills().removeByID("items.firearms_resistance");
		}
	}

	function onAdded()
	{
		this.armor_upgrade.onAdded();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getSkills().add(::new("scripts/skills/items/firearms_resistance_skill"));
		}
	}

	function onRemoved()
	{
		this.armor_upgrade.onRemoved();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getSkills().removeByID("items.firearms_resistance");
		}
	}

});

