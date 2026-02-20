this.pov_named_stollwurm_scales_upgrade <- ::inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.legend_stollwurm_scales";
		this.m.NameList = this.Const.Strings.PovLindwurmArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Scale Cloak";
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.Description = "A cloak made out of the scales of a legendary Stollwurm. Not only is it a rare and impressive trophy, it also offers additional protection";
		this.m.ArmorDescription = "A cloak made out of legendary Stollwurm scales is worn over this armor for additional protection.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_stollwurm.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_icon_named_upgrade_stollwurm.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_stollwurm.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_stollwurm_back_01";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_stollwurm_back_01_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_stollwurm_back_01_dead";
		this.m.Value = 10000;
		this.m.Condition = 80; //+5
		this.m.ConditionMax = 80; //+5
		this.m.DirectDamageModifier = -20.0; //+5
		this.m.StaminaModifier = -5;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.pov_named_armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immune to stun, knockback, grab and acid"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immune to stun, knockback, grab and acid"
		});
	}

	function onUpdateProperties( _properties )
	{
		this.pov_named_armor_upgrade.onUpdateProperties(_properties);
		_properties.IsImmuneToStun = true;
		_properties.IsImmuneToKnockBackAndGrab = true;
	}

	function onEquip()
	{
		this.item.onEquip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().add("body_immune_to_acid");
		}
	}

	function onUnequip()
	{
		this.item.onUnequip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().remove("body_immune_to_acid");
		}
	}

	function onAdded()
	{
		this.armor_upgrade.onAdded();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().add("body_immune_to_acid");
		}
	}

	function onRemoved()
	{
		this.armor_upgrade.onRemoved();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().remove("body_immune_to_acid");
		}
	}

});

