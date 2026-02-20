this.pov_named_bone_platings_upgrade <- ::inherit("scripts/items/armor_upgrades/named/pov_named_armor_upgrade", {
	m = {
		IsUsed = false
	},
	function create()
	{
		this.pov_named_armor_upgrade.create();
		this.m.ID = "legend_armor.pov_bone_platings";
		this.m.NameList = this.Const.Strings.PovUnholdArmorNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Bone Plating";
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.Description = "Crafted from strong but surprisingly light bones, these ornate platings make for an ablative armor to be worn ontop of regular armor.";
		this.m.ArmorDescription = "A layer of ornate bone plates is attached to this armor.";
		this.m.Icon = "armor_upgrades/pov_named_upgrade_bone.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/pov_icon_named_upgrade_bone.png";
		this.m.OverlayIconLarge = "armor_upgrades/pov_inventory_named_upgrade_bone.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_06_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_06_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_06_back_dead";
		this.m.Value = 2000;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -3;
		this.m.DamageReceivedArmorMult = -10.0;
		this.m.SpecialValue = 0;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.pov_named_armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Completely absorbs the first hit of every combat encounter which doesn\'t ignore armor"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Completely absorbs the first hit of every combat encounter which doesn\'t ignore armor"
		});
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (this.m.IsUsed)
		{
			return;
		}

		if (_hitInfo.BodyPart == this.Const.BodyPart.Body && _hitInfo.DamageDirect < 1.0)
		{
			this.m.IsUsed = true;
			_properties.DamageReceivedTotalMult = 0.0;
		}
	}

	function onCombatFinished()
	{
		this.m.IsUsed = false;
	}

});

