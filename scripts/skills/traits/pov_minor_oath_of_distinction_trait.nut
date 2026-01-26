this.pov_minor_oath_of_distinction_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_distinction";
		this.m.Name = "Minor Oath of Distinction";
		this.m.Icon = "ui/traits/trait_icon_88.png";
		this.m.Description = "This character has taken the Minor Oath of Distinction, and is sworn to seek power in solace.";
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
				icon = "ui/icons/xp_received.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] more Experience in general..."
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "...But get [color=" + this.Const.UI.Color.NegativeValue + "]0%[/color] Experience from allied kills"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 1.5;
		_properties.IsAllyXPBlocked = true;
	}

});

