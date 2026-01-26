this.pov_steel_buckler_shield <- this.inherit("scripts/items/shields/shield", {
	m = {
		PrimaryOffhandAttack = null
		},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.pov_steel_buckler";
		this.m.Name = "Steel Buckler";
		this.m.Description = "A small shield, made primarily of steel. Despire the material, it remains relatively light due to its small size, and can be very useful with parrying attacks while able to take a beating. Can also be used as a blunt instrument.";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			1,
			2,
			3
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 500;
		this.m.MeleeDefense = 10;
		this.m.RangedDefense = 10;
		this.m.StaminaModifier = -7;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
	}

	function getTooltip()
	{
		local result = this.shield.getTooltip();
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
		this.m.Sprite = "pov_steel_buckler_shield_0" + this.m.Variant;
		this.m.SpriteDamaged = "pov_steel_buckler_shield_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "pov_steel_buckler_shield_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "shields/pov_inventory_steel_buckler_shield_0" + this.m.Variant + ".png";
		this.m.Icon = "shields/pov_icon_steel_buckler_shield_0" + this.m.Variant + ".png";
	}

	function onEquip()
	{
		this.shield.onEquip();
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
		shield.onUnequip();
		m.PrimaryOffhandAttack = null;
	}

	function getPrimaryOffhandAttack ()
	{
		return m.PrimaryOffhandAttack;
	}

});

