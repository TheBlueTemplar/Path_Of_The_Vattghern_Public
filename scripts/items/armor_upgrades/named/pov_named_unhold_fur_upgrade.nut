this.pov_named_unhold_fur_upgrade <- ::inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.pov_unhold_fur";
		this.m.NameList = this.Const.Strings.PovUnholdArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Unhold Fur";
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.Description = "A thick cloak made out of a Frost Unhold\'s majestic white fur. Can be worn atop any armor to make the wearer more resilient against ranged weapons.";
		this.m.ArmorDescription = "A cloak of thick white fur has been attached to this armor to make it more resilient against ranged weapons.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_unhold.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_icon_named_upgrade_unhold.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_unhold.png";
		this.m.SpriteFront = "upgrade_02_front";
		this.m.SpriteBack = "upgrade_02_back";
		this.m.SpriteDamagedFront = "upgrade_02_front_damaged";
		this.m.SpriteDamagedBack = "upgrade_02_back";
		this.m.SpriteCorpseFront = "upgrade_02_front_dead";
		this.m.SpriteCorpseBack = "upgrade_02_back_dead";
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -3;
		this.m.SpecialValue = 30; // ranged def.
		this.m.Value = 2300;
		this.randomizeValues();
	}

	function randomizeValues()
	{
		this.pov_named_armor_upgrade.randomizeValues();
		this.m.SpecialValue = ::Math.min(45, ::Math.ceil(this.m.SpecialValue * ::Math.rand(110, 140) * 0.01));
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

