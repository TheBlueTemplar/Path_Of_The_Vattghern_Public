this.pov_named_feuerbuchse <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {
		IsLoaded = true,
		isOverloaded = false // yes, its like that
	},

	function create()
	{
		this.named_weapon.create();
		this.m.Variant = this.Math.rand(1, 2);
		this.updateVariant();
		this.m.ID = "weapon.pov_named_feuerbuchse";
		this.m.NameList = this.Const.Strings.PovGunNames;
		//this.m.PrefixList = this.Const.Strings.SouthernPrefix;
		//this.m.SuffixList = this.Const.Strings.SouthernSuffix;
		this.m.Description = "A usually rough weapon, refined and decorated, built to perfection by a very capable craftsman. It can rain fiery sharpnel upon the enemy, and while heavier than its southern counterpart, its design is meant to maximise overall disruption rather than direct lethality. Can not be used while engaged in melee.";
		this.m.Categories = "Firearm, Two-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.TwoHanded;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 4000;
		this.m.RangeMin = 2;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RangeMaxBonus = 1;
		// Comparison to (named) handgonne:
		// -1stam, -5cond, - 7-10dmg, +0.4a.dmg, -0.05a.pen.
		this.m.StaminaModifier = -15;
		this.m.Condition = 45.0;
		this.m.ConditionMax = 45.0;
		this.m.RegularDamage = 28;
		this.m.RegularDamageMax = 65;
		this.m.ArmorDamageMult = 1.4;
		this.m.DirectDamageMult = 0.2;
		this.m.IsEnforcingRangeLimit = true;
		this.randomizeValues();
	}

	function getAmmoID()
	{
		return "ammo.powder";
	}

	function updateVariant() 
	{
		this.m.Icon = "weapons/ranged/pov_named_feuerbuchse_70x70_0" + this.m.Variant + ".png";
		this.m.IconLarge = "weapons/ranged/pov_named_feuerbuchse_0" + this.m.Variant + ".png";
		this.m.ArmamentIcon = "pov_icon_named_feuerbuchse_0" + this.m.Variant + "_loaded";
	}

	function isLoaded()
	{
		return this.m.IsLoaded;
	}

	function setLoaded( _l )
	{
		this.m.IsLoaded = _l;

		if (_l) {
			this.m.ArmamentIcon = "pov_icon_named_feuerbuchse_0" + this.m.Variant + "_loaded";
		} else {
			this.m.ArmamentIcon = "pov_icon_named_feuerbuchse_0" + this.m.Variant + "_empty";
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
			text = "The [color=" + this.Const.UI.Color.povPerkPurple + "]Improvised Strike[/color] skill does [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] more damage."
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
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/fire_handgonne_skill"));

		if (!this.m.IsLoaded)
		{
			this.addSkill(this.new("scripts/skills/actives/reload_handgonne_skill"));
		}

		local strike = this.new("scripts/skills/actives/knock_out");
		strike.m.IsRangedKnockOut = true;
		this.addSkill(strike);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties)
	{
		if(_skill != null && _skill.getID() == "actives.knock_out")
		{
			_properties.DamageTotalMult *= 1.20;
		}
	}

	function onCombatFinished()
	{
		this.named_weapon.onCombatFinished();
		this.m.IsLoaded = true;
	}

	//Fotn Stuff 
	//ABYSS
	function isOverloaded()
	{
		return this.m.isOverloaded;
	}

	function setOverloaded(_bool)
	{
		return this.m.isOverloaded = _bool;
	}

});

