this.pov_specialist_bodyguard_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.longsword",
			"weapon.legend_named_longsword",
			"weapon.longsword",
		],
		ApplicableItemTypes = [
			this.Const.Items.ItemType.TwoHanded
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Sword
		],
		BonusMelee = 10,
		BonusDamage = 8
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistBodyguard);
		this.m.IconMini = "pov_perk_spec_2hsword_mini";
	}

	// function specialistWeaponTooltip (_item, _isRanged)
	// {
	// 	local properties = this.getContainer().getActor().getCurrentProperties();
	// 	local tooltip = [];

	// 	tooltip.extend([{
	// 		id = 7,
	// 		type = "text",
	// 		icon = "ui/icons/hitchance.png",
	// 		text = "[color=%positive%]+" + this.calculateSpecialistBonus(this.m.BonusMelee, _item) + "[/color] chance to hit"
	// 	},
	// 	{
	// 		id = 8,
	// 		type = "text",
	// 		icon = "ui/icons/special.png",
	// 		text = "[color=%positive%]+" + this.calculateSpecialistBonus(20, _item) + "%[/color] Riposte Damage"
	// 	},
	// 	{
	// 		id = 9,
	// 		type = "text",
	// 		icon = "ui/icons/special.png",
	// 		text = "[color=%positive%]+" + this.calculateSpecialistBonus(10, _item) + "%[/color] Area of Effect attacks"
	// 	}]);
	// 	if (::Legends.S.isCharacterWeaponSpecialized(properties, _item))
	// 	{
	// 		tooltip.push({
	// 			id = 7,
	// 			type = "text",
	// 			icon = "ui/icons/damage_dealt.png",
	// 			text = "[color=%positive%]+" + this.calculateSpecialistBonus(this.m.BonusDamage, _item) + "%[/color] Damage"
	// 		});
	// 	}
	// 	return tooltip;
	// }

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			if (_properties.IsRiposting)
			{
				_properties.DamageTotalMult *= 1.0 + 0.01 * this.calculateSpecialistBonus(15, _skill.getItem());
			}

			if (_skill.isAOE() && _skill.isAttack() && !_skill.isRanged())
			{
				_properties.DamageTotalMult *= 1 + 0.01 * this.calculateSpecialistBonus(10, _skill.getItem());
			}
		}
	}
});
