this.pov_goblin_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_goblin_mutagen_item";
		this.m.Name = "Goblin Mutagen";
		this.m.Description = "This mutagen reshapes the body into a wiry, quick-footed form, enhancing agility and sharpshooting prowess while sapping resilience. [color=" + this.Const.UI.Color.povTooltipRed + "]Movement becomes swift and efficient[/color], making complex maneuvers feel effortless, while [color=" + this.Const.UI.Color.povTooltipRed + "]ranged attacks strike with uncanny precision[/color], often slipping through gaps in an enemy\'s guard. Even careful, [color=" + this.Const.UI.Color.povTooltipRed + "]methodical shots require less effort to execute[/color], making them deadlier in skilled hands.\n\nHowever, [color=" + this.Const.UI.Color.povTooltipRed + "]the body grows frail[/color], struggling to withstand direct blows, and the [color=" + this.Const.UI.Color.povTooltipRed + "]mind becomes more prone to panic[/color] under pressure. [color=" + this.Const.UI.Color.povTooltipRed + "]Heavier armor feels especially cumbersome[/color], draining stamina far faster than usual, forcing reliance on speed, positioning, and ambush tactics to survive.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_goblin.png";
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
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

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
			id = 65,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "Mutates the body, causing severe sickness"
		});

		result.push({
			id = 65,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "Must be a Vatt\'ghern or a Mutant, and not already used this mutagen."
		});

		return result;
	}

	function onUse( _actor, _item = null )
	{
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Goblin);
	}

});

