this.pov_minor_oath_of_sacrifice_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_sacrifice";
		this.m.Name = "Minor Oath of Sacrifice";
		this.m.Icon = "ui/traits/trait_icon_87.png";
		this.m.Description = "This character has taken the Minor Oath of Sacrifice, swearing to deny any excess, edible or monetary.";
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
				icon = "ui/icons/money2.png",
				text = "Demands only [color=" + this.Const.UI.Color.PositiveValue + "]half[/color] of Daily Wage"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/asset_food.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]-50%[/color] Food Consumption"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.DailyWageMult *= 0.5;
		_properties.DailyFood *= 0.5;
	}

});

