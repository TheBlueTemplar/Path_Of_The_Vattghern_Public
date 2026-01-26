this.pov_corpse_forsaken_item <- this.inherit("scripts/items/misc/corpse/pov_corpse_item", {
	m = {},
	function create()
	{
		this.pov_corpse_item.create();
		this.m.ID = "supplies.pov_corpse_forsaken";
		this.m.Name = "Forsaken Corpse";
		this.m.Description = "This corpse is still in fairly good condition. Heavily mutated, the possibilities of this corpse are endless!\n\nSomeone skilled in alchemy may be able to extract useful materials from it.";
		this.m.Icon = "consumables/pov_corpse_forsaken.png";
		this.m.GoodForDays = 12;
		this.m.Value = 80;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		result.push({
				id = 3,
				type = "image",
				image = "consumables/pov_enemy_forsaken.png",
		});

		result.push({
			id = 11,
			type = "text",
			//icon = "ui/icons/special.png",
			text = "The \"Forsaken\" are mutants who lost control of their own unnatural abilities, and having horribly over mutated, their sanity. They are barely human anymore, and to put them down is an act of mercy.\n\n In combat, they are a destructive force, making use of their many different skills. Continuing the lifestyle of the brigand, they have their hands on equipment not usually seen on their peers."
		});

		result.push({
			id = 67,
			type = "hint",
			icon = "ui/icons/warning.png",
			text = "Will decompose in [color=" + this.Const.UI.Color.NegativeValue + "]" + this.getSpoilInDays() + "[/color] days."
		});

		return result;

	}

});

