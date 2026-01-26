this.pov_named_steel_buckler_shield <- this.inherit("scripts/items/shields/named/named_shield", {
	m = {
		PrimaryOffhandAttack = null
		},
	function create()
	{
		this.named_shield.create();
		this.m.ID = "shield.pov_named_steel_buckler";
		//this.m.Name = "Steel Buckler";
		this.m.NameList = this.Const.Strings.ShieldNames;
		this.m.Description = "A steel buckler of superior quality, obviously the result of an excellent craftsman. Decorated with ornate details. Despire its looks, its central metal tip is further reinforced, allowing for more powerful bashes.";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			1,
			2,
			3
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 1250;
		this.m.MeleeDefense = 10;
		this.m.RangedDefense = 10;
		this.m.StaminaModifier = -7;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.named_shield.getTooltip();
		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "The [color=" + this.Const.UI.Color.povPerkPurple + "]Buckler Bash[/color] skill does [color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] more damage."
		});
		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "In battle, [color=" + this.Const.UI.Color.PositiveValue + "]greatly increases[/color] defenses when engaged with one to three enemies."
		});
		return result;
	}

	function updateVariant()
	{
		this.m.Sprite = "pov_named_steel_buckler_shield_0" + this.m.Variant;
		this.m.SpriteDamaged = "pov_named_steel_buckler_shield_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "pov_named_steel_buckler_shield_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "shields/pov_inventory_named_steel_buckler_shield_0" + this.m.Variant + ".png";
		this.m.Icon = "shields/pov_icon_named_steel_buckler_shield_0" + this.m.Variant + ".png";
	}

	function onEquip()
	{
		this.named_shield.onEquip();
		::Legends.Actives.grant(this, ::Legends.Active.KnockBack);
		::Legends.Actives.grant(this, ::Legends.Active.LegendBucklerBash, function (_skill) {
			_skill.m.Icon = "skills/pov_active_steel_buckler_bash.png";
			_skill.m.IconDisabled = "skills/pov_active_steel_buckler_bash_sw.png";
			_skill.m.Overlay = "pov_active_steel_buckler_bash";
			this.m.PrimaryOffhandAttack = ::MSU.asWeakTableRef(_skill);
		}.bindenv(this));

		::Legends.Effects.grant(this, ::Legends.Effect.LegendBuckler, function(_effect) {
			_effect.m.Order = this.Const.SkillOrder.UtilityTargeted + 1;
			_effect.m.DefenseSingleEnemy = 15; // 3 increase
			_effect.m.DefenseTwoEnemies = 8; // 2 increase
			_effect.m.DefenseThreeEnemies = 5; // 1 increase
			_effect.setItem(this);
			this.m.SkillPtrs.push(_effect);
		}.bindenv(this));
	}

	function onUnequip ()
	{
		named_shield.onUnequip();
		m.PrimaryOffhandAttack = null;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill != null && _skill.getID() == "actives.legend_buckler_bash")
		{
			_properties.DamageTotalMult *= 1.30;
		}
	}

	function getPrimaryOffhandAttack ()
	{
		return m.PrimaryOffhandAttack;
	}

});

