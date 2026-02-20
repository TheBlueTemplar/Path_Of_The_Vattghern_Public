this.pov_named_ghost_plates_upgrade <- this.inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor_upgrade.body.pov_ghost_plates";
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.NameList = this.Const.Strings.PovArmorGhostArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		this.m.Description = "Masterwork metal reinforcements, infused with the essense of the strongest of the rustunggheist. On top of providing additional excellent protection against physical attacks, it also helps repel the aetherium, weakening spirit\'s attacks against the wearer. Has a similar - but weaker - effect against other undead.";
		this.m.ArmorDescription = "Sturdy, infused metal reinforcements have been added to the armor, weakening spirit and undead attacks against the wearer.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_ghost_plates.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_named_icon_upgrade_ghost_plates.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_named_inventory_upgrade_ghost_plates.png";
		this.m.SpriteBack = "pov_upgrade_ghost_plates";
		this.m.SpriteDamagedBack = "pov_upgrade_ghost_plates_damaged";
		this.m.SpriteCorpseBack = "pov_upgrade_ghost_plates_dead";

		this.m.Value = 3800;
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -5;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.pov_named_armor_upgrade.getTooltip();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces damage taken from ghost type enemies by [color=" + this.Const.UI.Color.PositiveValue + "]-35%[/color] and by [color=" + this.Const.UI.Color.PositiveValue + "]-20%[/color] for other undead"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces damage taken from ghost type enemies by [color=" + this.Const.UI.Color.PositiveValue + "]-35%[/color] and by [color=" + this.Const.UI.Color.PositiveValue + "]-20%[/color] for other undead"
		});
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo != null && _attacker.getFlags().has("ghost"))
		{
			_properties.DamageReceivedTotalMult *= 0.65;
		} 
		else if (_hitInfo != null && _attacker.getFlags().has("undead"))
		{
			_properties.DamageReceivedTotalMult *= 0.80;
		}
	}

});

