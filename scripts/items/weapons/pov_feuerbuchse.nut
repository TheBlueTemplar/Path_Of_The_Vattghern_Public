this.pov_feuerbuchse <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		IsLoaded = true,
		IsOverloaded = false
	},

	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.pov_feuerbuchse";
		this.m.Name = "Feuerbuchse";
		this.m.Description = "A rough weapon, capable of raining fiery sharpnel upon the enemy. Heavier than its southern counterpart, its design is meant to maximise overall disruption rather than direct lethality. Can not be used while engaged in melee.";
		this.m.Categories = "Firearm, Two-Handed";
		this.m.Variant = this.Math.rand(1, 2);
		this.updateVariant();
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.TwoHanded;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 2250;
		this.m.RangeMin = 2;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RangeMaxBonus = 1;
		// Comparison to handgonne:
		// -1stam, -5cond, - 5-10dmg, +0.4a.dmg, -0.05a.pen.
		this.m.StaminaModifier = -17;
		this.m.Condition = 45.0;
		this.m.ConditionMax = 45.0;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 65;
		this.m.ArmorDamageMult = 1.4;
		this.m.DirectDamageMult = 0.25; // has to be done like that...
		this.m.DirectDamageAdd = -0.05; // see above
		this.m.IsEnforcingRangeLimit = true;
	}

	function getAmmoID()
	{
		return "ammo.powder";
	}

	function updateVariant() 
	{
		this.m.Icon = "weapons/ranged/pov_feuerbuchse_70x70_0" + this.m.Variant + ".png";
		this.m.IconLarge = "weapons/ranged/pov_feuerbuchse_0" + this.m.Variant + ".png";
		this.m.ArmamentIcon = "pov_icon_feuerbuchse_0" + this.m.Variant + "_loaded";
	}

	function isLoaded()
	{
		return this.m.IsLoaded;
	}

	function setLoaded( _l )
	{
		this.m.IsLoaded = _l;

		if (_l) {
			this.m.ArmamentIcon = "pov_icon_feuerbuchse_0" + this.m.Variant + "_loaded";
		} else {
			this.m.ArmamentIcon = "pov_icon_feuerbuchse_0" + this.m.Variant + "_empty";
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
		this.addSkill(this.new("scripts/skills/actives/fire_handgonne_skill"));

		if (!this.m.IsLoaded)
		{
			this.addSkill(this.new("scripts/skills/actives/reload_handgonne_skill"));
		}

		local strike = this.new("scripts/skills/actives/knock_out");
		strike.m.IsRangedKnockOut = true;
		this.addSkill(strike);
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

