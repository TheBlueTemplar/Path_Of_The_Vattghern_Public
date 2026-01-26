this.pov_autopsy_forsaken_item <- this.inherit("scripts/items/misc/anatomist/anatomist_potion_item", {
	m = {},
	function create()
	{
		this.anatomist_potion_item.create();
		this.m.ID = "misc.pov_autopsy_forsaken_item";
		this.m.Name = "Forsaken Autopsy";
		this.m.Description = "Attempt to extract useful items from this forsaken corpse.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_autopsy_forsaken.png";
		this.m.Value = 400;
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


		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/pov_mutagen_shard_icon.png",
			text = "Acquire [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] Random mutagen.\n[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] chance."
		});

		return result;

	}





});