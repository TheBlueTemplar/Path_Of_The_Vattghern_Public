this.pov_corpse_fault_finder_item <- this.inherit("scripts/items/misc/corpse/pov_corpse_item", {
	m = {},
	function create()
	{
		this.pov_corpse_item.create();
		this.m.ID = "supplies.pov_corpse_fault_finder";
		this.m.Name = "Fault Finder\'s Corpse";
		this.m.Description = "The cursed corpse of a Fault Finder a truly deranged man who performed the hidde, vile and forbidden art of crafting.\n\nOne skilled in alchemy may be able to extract useful materials from this.";
		this.m.Icon = "consumables/pov_corpse_fault_finder.png";
		this.m.Value = 150;
		this.m.GoodForDays = 15;
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
				image = "consumables/pov_enemy_fault_finder.png",
		});

		result.push({
			id = 11,
			type = "text",
			//icon = "ui/icons/special.png",
			text = "The Fault Finder is a truly deranged man, once obsessed with uncovering flaws not only in craft, but in flesh itself. In life, he practiced hidden, vile, and forbidden arts, treating the human body as something to be corrected rather than preserved. \n\nHis corpse is a grim patchwork of \"improvements\". Bones reforged, muscles restitched, organs rearranged with crude alchemical purpose. Nothing about him is natural, and nothing was done without intent... every graft marks a lesson learned through suffering, and a deeper descent into madness."
		});
		result.push({
			id = 67,
			type = "hint",
			icon = "ui/icons/warning.png",
			text = "Will fully decompose in [color=" + this.Const.UI.Color.NegativeValue + "]" + this.getSpoilInDays() + "[/color] days."
		});

		return result;

	}

});

