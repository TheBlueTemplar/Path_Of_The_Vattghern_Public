this.pov_minor_oath_of_endurance_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_endurance";
		this.m.Name = "Minor Oath of Endurance";
		this.m.Icon = "ui/traits/trait_icon_84.png";
		this.m.Description = "This character has taken the Minor Oath of Endurance, and is sworn to endure!";
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
				icon = "ui/icons/fatigue.png",
				text = "Spend [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] less Fatigue on all actions."
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.FatigueEffectMult *= 0.90;
	}

});

