this.pov_necromancy_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_necromancy_mutagen";
		this.m.Name = "Necromancy Mutagen";
		this.m.Description = "This vile mutagen originates from the corrupted essence of weidergangers, infecting the vatt\'ghern with a twisted blend of resilience and despair, but also granting access to the black arts...\n\n The mutation strengthens the body, [color=" + this.Const.UI.Color.povTooltipRed + "]accelerating experience gain and drastically increasing the threshold for sustaining injuries[/color], while also allowing the user to tap into the darkness, and [color=" + this.Const.UI.Color.povTooltipRed + "]resurrect corpses[/color]. \n\n Yet, such unnatural vigor comes at a heavy cost. Aside from an innate [color=" + this.Const.UI.Color.povTooltipRed + "]weakness to fire[/color], the infected suffer relentless and haunting visions, [color=" + this.Const.UI.Color.povTooltipRed + "]eroding their resolve[/color] and leaving them vulnerable to fear and doubt. A double-edged \"gift\" indeed.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_necromancy.png";
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
			text = "Must have Witcher Mutation and not already used this mutagen."
		});

		return result;
	}

	function onUse( _actor, _item = null )
	{
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Necromancy);
	}

});
