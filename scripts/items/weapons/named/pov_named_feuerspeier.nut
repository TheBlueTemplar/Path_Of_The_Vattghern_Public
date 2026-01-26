this.pov_named_feuerspeier <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {
		IsLoaded = true
	},

	function create()
	{
		this.named_weapon.create();
		this.m.ID = "weapon.pov_named_feuerspeier";
		//this.m.Name = "Feuerspeier";
		this.m.NameList = this.Const.Strings.PovGunNames;
		//this.m.PrefixList = this.Const.Strings.SouthernPrefix;
		//this.m.SuffixList = this.Const.Strings.SouthernSuffix;
		this.m.Description = "A very heavy and expensive weapon. Built on high quality cherry wood, and decorated with intricate ornaments, it could decorate a lord\'s hall just as well as it dominates the battlefield. Its golden mouth spews fire on its enemies, whereas its tip point can inflict terrible wounds from up close. A very rare and expensive piece indeed...";
		this.m.Categories = "Firearm, Two-Handed";
		//this.m.Variant = this.Math.rand(1, 2);
		//this.updateVariant();
		this.m.Icon = "weapons/ranged/pov_named_feuerspeier_70x70.png";
		this.m.IconLarge = "weapons/ranged/pov_named_feuerspeier.png";
		this.m.ArmamentIcon = "pov_icon_named_feuerspeier_loaded";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.TwoHanded;
		this.m.EquipSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 7000;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RangeMaxBonus = 1;
		// Comparison to handgonne:
		// much more damage and armor effectiveness, but very low armor pen and accuracy
		this.m.StaminaModifier = -18;
		this.m.Condition = 75.0;
		this.m.ConditionMax = 75.0;
		this.m.RegularDamage = 40;
		this.m.RegularDamageMax = 85;
		this.m.ArmorDamageMult = 1.6;
		this.m.DirectDamageMult = 0.25; // has to be done like that...
		this.m.DirectDamageAdd = -0.10; // armor pen = 15% only!
		this.m.ChanceToHitHead = 10;
		this.m.AdditionalAccuracy = -5; //-5
		this.m.IsEnforcingRangeLimit = true;
		this.randomizeValues();
	}

	function getAmmoID()
	{
		return "ammo.powder";
	}

	/*function updateVariant() 
	{
		this.m.Icon = "weapons/ranged/pov_feuerbuchse_70x70_0" + this.m.Variant + ".png";
		this.m.IconLarge = "weapons/ranged/pov_feuerbuchse_0" + this.m.Variant + ".png";
		this.m.ArmamentIcon = "pov_icon_feuerbuchse_0" + this.m.Variant + "_loaded";
	}*/

	function isLoaded()
	{
		return this.m.IsLoaded;
	}

	function setLoaded( _l )
	{
		this.m.IsLoaded = _l;

		if (_l) {
			this.m.ArmamentIcon = "pov_icon_named_feuerspeier_loaded";
		} else {
			this.m.ArmamentIcon = "pov_icon_named_feuerspeier_empty";
		}

		this.updateAppearance();
	}

	function getRangeEffective()
	{
		return this.m.RangeMax + 2;
	}

	function getTooltip()
	{
		local result = this.named_weapon.getTooltip();

		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "The [color=" + this.Const.UI.Color.povPerkPurple + "]Improvised Strike[/color] and [color=" + this.Const.UI.Color.povPerkPurple + "]Heavy Thrust[/color] skills do [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] more damage."
		});

		if (!this.m.IsLoaded)
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Must be reloaded before firing again[/color]"
			});
		}

		return result;
	}

	function onCombatFinished()
	{
		this.setLoaded(true);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties)
	{
		if (_skill != null)
		{
			if(_skill.getID() == "actives.knock_out" && _skill.getID() == "actives.thrust")
			{
				_properties.DamageTotalMult *= 1.10;
			}
		}
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/pov_fire_handgonne_skill"));

		if (!this.m.IsLoaded)
		{
			this.addSkill(this.new("scripts/skills/actives/reload_handgonne_skill"));
		}

		local strike = this.new("scripts/skills/actives/knock_out");
		strike.m.IsRangedKnockOut = true;
		strike.m.IsHeavyGun = true;
		this.addSkill(strike);

		local thrust = this.new("scripts/skills/actives/thrust");
		thrust.m.IsGun = true;
		this.addSkill(thrust);
	}

	function onCombatFinished()
	{
		this.named_weapon.onCombatFinished();
		this.m.IsLoaded = true;
	}

});

