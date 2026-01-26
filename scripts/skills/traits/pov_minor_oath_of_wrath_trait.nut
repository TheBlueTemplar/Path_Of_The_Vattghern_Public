this.pov_minor_oath_of_wrath_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_wrath";
		this.m.Name = "Minor Oath of Wrath";
		this.m.Icon = "ui/traits/trait_icon_80.png";
		this.m.Description = "This character has taken the Minor Oath of Wrath, having sworn to smite even the enemy!";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
		this.m.Excluded = [];
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Damage done."
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "All kills are fatalities (if the weapon allows)."
			}
		];
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack())
		{
			_properties.FatalityChanceMult = 1000.0;
			_properties.DamageTotalMult *= 1.10;
		}
	}

});

