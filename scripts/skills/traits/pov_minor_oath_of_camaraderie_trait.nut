this.pov_minor_oath_of_camaraderie_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_camaraderie";
		this.m.Name = "Minor Oath of Camaderie";
		this.m.Icon = "ui/traits/trait_icon_85.png";
		this.m.Description = "This character has taken the Minor Oath of Camaraderie, sworn to appreciate his company.";
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
				icon = "ui/icons/morale.png",
				text = "Gets a large mood boost, when this perk is activated."
			}
		];
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (actor != null)
		{
			actor.improveMood(2.0, "The power of Camaraderie!");
		}
	}

});

