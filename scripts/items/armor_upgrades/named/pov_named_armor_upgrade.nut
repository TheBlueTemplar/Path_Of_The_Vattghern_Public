this.pov_named_armor_upgrade <- ::inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	// ik legends has one, I just want my own lol
	m = {
		PrefixList = [],
		SuffixList = [],
		NameList = [],
		DefaultName = "",
		UseRandomName = false,
		SpecialValue = 0
	},

	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.ItemType = this.m.ItemType | ::Const.Items.ItemType.Named;
		this.m.IsPrecious = true;
		this.m.IsDroppedAsLoot = true;
	}

	/*function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = getDescription()
			}
		];
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});
		result.push({
			id = 4,
			type = "progressbar",
			icon = "ui/icons/armor_body.png",
			value = this.getCondition(),
			valueMax = this.getConditionMax(),
			text = "" + this.getCondition() + " / " + this.getConditionMax() + "",
			style = "armor-body-slim"
		});

		if (this.getStaminaModifier() != 0)
		{
			result.push({
				id = 5,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Weight: " + ::Legends.S.colorize("" + ::Legends.S.getSign(this.getStaminaModifier()) + this.Math.abs(this.getStaminaModifier()), this.getStaminaModifier())
			});
		}

		if ( this.getStaminaModifier() < 0 && ::Legends.Mod.ModSettings.getSetting("ShowArmorPerFatigueValue").getValue() )
		{
			result.push({
				id = 5,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = format("(%.1f Armor per 1 Weight)", this.getConditionMax() / (1.0 * this.Math.abs(this.getStaminaModifier())))
			});
		}

		// Effects
		this.applyEffectTooltips(result);

		// Other Stuff

		if (this.getOverlayIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getOverlayIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		// Interaction Tooltips
		result.push({
			id = 70,
			type = "hint",
			icon = "ui/icons/mouse_right_button.png",
			text = "Right-click or left-click and drag onto the armor of the currently selected character to attach."
		});
		result.push({
			id = 71,
			type = "hint",
			icon = "ui/icons/mouse_left_button_shift.png",
			text = "Hold Shift and drag onto an armor in the stash to attach."
		});
		result.push({
			id = 72,
			type = "hint",
			icon = "ui/icons/mouse_left_button_shift.png", //I wish I could vanish this easily
			text = "Hold Left-Shift and Left-Click this layer square to toggle it hidden on this character (stats & other benefits will not be affected)."
		});

		local rune = ::Legends.Runes.get(this.getRuneVariant());
		if (rune != null) {
			result.push({
				id = 77,
				type = "text",
				icon = "ui/icons/special.png",
				text = rune.getTooltip(this)
			});
		}

		return result;
	}*/

	function getRandomCharacterName( _list )
	{
		return ::MSU.Array.rand(_list);
	}

	function createRandomName()
	{
		if (this.m.NameList.len() == 0) return null;

		if (!this.m.UseRandomName || ::Math.rand(1, 100) <= 50)
		{
			if (this.m.SuffixList.len() == 0 || ::Math.rand(1, 100) <= 70)
			{
				return ::MSU.Array.rand(this.m.PrefixList) + " " + ::MSU.Array.rand(this.m.NameList);
			}
			else
			{
				return ::MSU.Array.rand(this.m.NameList) + " " + ::MSU.Array.rand(this.m.SuffixList);
			}
		}
		else if (::Math.rand(1, 2) == 1)
		{
			return this.getRandomCharacterName(::Const.Strings.KnightNames) + "\'s " + ::MSU.Array.rand(this.m.NameList);
		}
		else
		{
			return this.getRandomCharacterName(::Const.Strings.BanditLeaderNames) + "\'s " + ::MSU.Array.rand(this.m.NameList);
		}
	}

	function onAddedToStash( _stashID )
	{
		if (this.m.Name.len() == 0)
		{
			this.setName(this.createRandomName());
		}
	}

	function setName( _name )
	{
		if (_name == null)
		{
			this.m.Name = this.m.DefaultName;
			return;
		}

		if (this.m.DefaultName.len() != 0)
		{
			this.m.Name = _name + "\'s " +  this.m.DefaultName;
			return;
		}

		this.m.Name = _name;
	}

	function randomizeValues()
	{
		// - 0 to 2 weight (minor boost) (maybe make it 0 to 1?)
		this.m.StaminaModifier = ::Math.min(0, this.m.StaminaModifier + ::Math.rand(0, 2));
		//this.m.ConditionModifier = ::Math.floor(this.m.ConditionModifier * ::Math.rand(115, 140) * 0.01) * 1.0;
		this.m.Condition = this.Math.floor(this.m.Condition * this.Math.rand(115, 145) * 0.01) * 1.0;
		this.m.ConditionMax = this.m.Condition;

		if (this.m.ThreatModifier != 0)
		{
			// 10% to 50% increase
			// From: 7, Final Value: 8 - 11
			this.m.ThreatModifier = ::Math.min(25, ::Math.ceil(this.m.ThreatModifier * ::Math.rand(110, 150) * 0.01));
		}

		if (this.m.InitiativeModifier != 0)
		{
			// 10% to 50% increase
			// From: 15, Final Value: 17 - 21
			this.m.InitiativeModifier = ::Math.min(25, ::Math.ceil(this.m.InitiativeModifier * ::Math.rand(110, 140) * 0.01));
		}

		if (this.m.DamageReceivedArmorMult != 0)
		{
			// 10% to 50% increase
			// From: 15, Final Value: 17 - 21
			this.m.DamageReceivedArmorMult = ::Math.min(40, ::Math.ceil(this.m.DamageReceivedArmorMult * ::Math.rand(110, 150) * 0.01));
		}

		if (this.m.FatiguePenaltyMultiplier != 0)
		{
			// 10% to 50% increase
			// From: 15, Final Value: 17 - 21
			this.m.FatiguePenaltyMultiplier = ::Math.min(40, ::Math.ceil(this.m.FatiguePenaltyMultiplier * ::Math.rand(120, 150) * 0.01));
		}

		if (this.m.DirectDamageModifier != 0)
		{
			// 10% to 50% increase
			// From: 15, Final Value: 17 - 21
			this.m.DirectDamageModifier = ::Math.min(40, ::Math.ceil(this.m.DirectDamageModifier * ::Math.rand(120, 165) * 0.01));
		}
	}

	function onAdded()
	{
		//this.m.PreviousCondition = this.m.Armor.m.ConditionMax;
		//this.m.PreviousStamina = this.m.Armor.m.StaminaModifier;
		//this.m.Armor.m.ConditionMax += this.m.ConditionModifier;
		//this.m.Armor.m.Condition += this.m.ConditionModifier;
		//this.m.Armor.m.StaminaModifier += this.m.StaminaModifier;
		//this.m.ThreatModifier += this.m.ThreatModifier;
	}

	/*function onUpdateProperties(_properties)
	{
		//this.legend_armor_upgrade.onUpdate(_properties);
		//if (this.getInitiativeModifier() != 0) _properties.Initiative += this.getInitiativeModifier();
		if (this.m.ThreatModifier != 0) _properties.Threat += this.m.ThreatModifier;
		//if (this.getResolveModifier() != 0) _properties.Bravery += this.getResolveModifier();
		//if (this.getFatiguePenaltyMultiplier() != 0) _properties.Stamina += this.getCurrentFatigueModifier();	// We are adding to the Stamina of the wearer
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		//if (this.getDirectDamageModifier() != 0) _properties.DamageReceivedDirectMult *= 1.0 + (this.getDirectDamageModifier() / 100.0);
		//if (this.getDamageReceivedArmorMult() != 0) _properties.DamageReceivedArmorMult *= 1.0 + (this.getDamageReceivedArmorMult() / 100.0);
	}*/

	/*function onArmorTooltip( _result )
	{
		this.applyEffectTooltips(_result);
	}

	function applyEffectTooltips( _tooltipList )
	{
		if (this.m.ThreatModifier != 0)
		{
			_tooltipList.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Reduces the Resolve of any opponent engaged in melee by[color=" + ::Const.UI.Color.NegativeValue + "]+" + this.m.ThreatModifier + "[/color]"
			});
		}else
		{
			_tooltipList.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Threat modifier not appearing normally, value is:[color=" + ::Const.UI.Color.NegativeValue + "]+" + this.m.ThreatModifier + "[/color]"
			});
		}
	}*/

	function onSerialize( _out )
	{
		_out.writeString(this.m.Name);
		_out.writeF32(this.m.ConditionMax);
		_out.writeI16(this.m.StaminaModifier);
		_out.writeI16(this.m.SpecialValue);
		_out.writeI16(this.m.ThreatModifier);
		_out.writeI16(this.m.InitiativeModifier);
		_out.writeI16(this.m.DamageReceivedArmorMult);
		_out.writeI16(this.m.FatiguePenaltyMultiplier);
		_out.writeI16(this.m.DirectDamageModifier);
		this.legend_armor_upgrade.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.m.Name = _in.readString();
		this.m.ConditionMax = _in.readF32();
		this.m.StaminaModifier = _in.readI16();
		this.m.SpecialValue = _in.readI16();
		this.m.ThreatModifier = _in.readI16();
		this.m.InitiativeModifier = _in.readI16();
		this.m.DamageReceivedArmorMult = _in.readI16();
		this.m.FatiguePenaltyMultiplier = _in.readI16();
		this.m.DirectDamageModifier = _in.readI16();
		this.legend_armor_upgrade.onDeserialize(_in);
	}

});

