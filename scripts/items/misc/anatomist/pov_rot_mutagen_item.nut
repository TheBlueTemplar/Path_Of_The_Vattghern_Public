this.pov_rot_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_rot_mutagen";
		this.m.Name = "Rot Mutagen";
		this.m.Description = "This vile mutagen originates from the rotten body of the foul flesh golems, and their creators, allowing the vatt\'ghern to tap into their twisted power...\n\n The mutagen grants [color=" + this.Const.UI.Color.povTooltipRed + "]slightly increased resilience[/color], but especially infuses the vatt\'ghern with the [color=" + this.Const.UI.Color.povTooltipRed + "]essence of rot[/color], to the detriment of any enemy close to them. They also gain the ability to [color=" + this.Const.UI.Color.povTooltipRed + "]manipulate corpses, making them violently explode[/color]. \n\n Yet, such unnatural prowess comes at a heavy cost. Aside from an innate [color=" + this.Const.UI.Color.povTooltipRed + "]weakness to fire[/color], the gifted one becomes [color=" + this.Const.UI.Color.povTooltipRed + "]much slower, with their very reflexes dulled[/color]. Such is the power of rot...";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_rot.png";
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
			text = "Must be a Witcher or a Mutant and not already used this mutagen."
		});

		return result;
	}

	function onUse( _actor, _item = null )
	{
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Rot);
	}

});
