this.pov_minor_oath_of_fortification_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_fortification";
		this.m.Name = "Minor Oath of Fortification";
		this.m.Icon = "ui/traits/trait_icon_86.png";
		this.m.Description = "This character has taken the Minor Oath of Fortification, and is sworn to resist!";
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
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] Total Damage Reduction."
			}
		];
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{	
		_properties.DamageReceivedTotalMult *= 0.90;
	}

});

