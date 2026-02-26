this.pov_helmet_xmas_hat <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.pov_helmet_xmas_hat";
		this.m.Name = "Yule-Mütze";
		this.m.Description = "A winter accessory infused with festive cheer. When worn, it radiates warmth and seasonal luck. Even mercenaries sometimes take a break to celebrate.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [1,2];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 150;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
		// this.m.Vision = 1;
		this.m.IsLower = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
	}

	function getTooltip()
	{
		local result = this.legend_helmet_upgrade.getTooltip();
		this.onArmorTooltip(result);
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push(
			{
				id = 7,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Gain [color=%positive%]+2[/color] Resolve"
			}
		);
		_result.push(
			{
				id = 7,
				type = "text",
				icon = "ui/icons/pov_luck.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1%[/color] chance to have any attacker require two successful attack rolls in order to hit.."
			}
		);
		return _result;
	}

	function onUpdateProperties(_properties)
	{
		this.legend_helmet_upgrade.onUpdateProperties(_properties);
		_properties.Bravery += 2;
		_properties.RerollDefenseChance += 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "xmas_hat_" + variant;
		this.m.SpriteDamaged = "xmas_hat_" + variant + "_damaged";
		this.m.SpriteCorpse = "xmas_hat_" + variant + "_dead";
		this.m.Icon = "legend_helmets/vanity/inventory_xmas_hat_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
