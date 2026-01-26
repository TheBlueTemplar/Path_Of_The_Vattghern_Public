this.pov_feuerspeier <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		IsLoaded = true,
		IsOverloaded = false
	},

	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.pov_feuerspeier";
		this.m.Name = "Feuerspeier";
		this.m.Description = "A very heavy and expensive weapon, meant for knights. Capable of spewing fire on the enemy and inflicting terrifying wounds, despite its low penetrative power. Due to its very limited range, its built in a way where its weight can be utilised for defence, allowing for striking attacks, and thrusting ones, with its embedded spear point.";
		this.m.Categories = "Firearm, Two-Handed";
		//this.m.Variant = this.Math.rand(1, 2);
		//this.updateVariant();
		this.m.Icon = "weapons/ranged/pov_feuerspeier_70x70.png";
		this.m.IconLarge = "weapons/ranged/pov_feuerspeier.png";
		this.m.ArmamentIcon = "pov_icon_feuerspeier_loaded";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.TwoHanded;
		this.m.EquipSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 4500;
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
			this.m.ArmamentIcon = "pov_icon_feuerspeier_loaded";
		} else {
			this.m.ArmamentIcon = "pov_icon_feuerspeier_empty";
		}

		this.updateAppearance();
	}

	function getRangeEffective()
	{
		return this.m.RangeMax + 2;
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();

		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has access to secondary but powerful melee attacks."
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

	function onEquip()
	{
		this.weapon.onEquip();
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
		this.weapon.onCombatFinished();
		this.m.IsLoaded = true;
	}

	//Fotn Stuff 
	//ABYSS
	function isOverloaded()
	{
		return this.m.IsOverloaded;
	}

	function setOverloaded(_bool)
	{
		return this.m.IsOverloaded = _bool;
	}

});

