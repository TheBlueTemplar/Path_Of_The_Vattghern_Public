this.pov_minor_oath_of_valor_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_valor";
		this.m.Name = "Minor Oath of Valor";
		this.m.Icon = "ui/traits/trait_icon_83.png";
		this.m.Description = "This character has taken the Minor Oath of Valor, sworn to face all adversity!";
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
				icon = "ui/icons/morale.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] Resolve."
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.BraveryMult *= 1.30;
	}

});

