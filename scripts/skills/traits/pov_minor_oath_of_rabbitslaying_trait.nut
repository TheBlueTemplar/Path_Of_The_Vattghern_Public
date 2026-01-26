this.pov_minor_oath_of_rabbitslaying_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_rabbitslaying";
		this.m.Name = "Grand Oath of Rabbitslaying!";
		this.m.Icon = "ui/traits/trait_icon_82.png";
		this.m.Description = "This character has taken the most severe of oaths, to take vengeance for the death of the once great python knight, and slay the Beast of Caerbannog.";
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
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+1000%[/color] Damage against the Beast of Caerbannog."
			}
		];
	}

});

