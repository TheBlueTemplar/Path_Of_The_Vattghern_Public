this.pov_skeleton_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_skeleton_mutagen";
		this.m.Name = "Undeath Mutagen";
		this.m.Description = "This mutagen infuses the bearer with traits of the undead, granting unnatural resilience at a steep cost. [color=" + this.Const.UI.Color.povTooltipRed + "]Piercing attacks are less effective against them[/color], and their [color=" + this.Const.UI.Color.povTooltipRed + "]reduced need for food[/color] makes them easy to sustain. They also present [color=" + this.Const.UI.Color.povTooltipRed + "]greater endurance in battle[/color], and their emotions are muted, making psychic attacks against them weaker. Additionally, thanks to their \"curse\", they are [color=" + this.Const.UI.Color.povTooltipRed + "]able to manifest a distruptive miasma[/color], disorganising enemy lines. \n\n However, [color=" + this.Const.UI.Color.povTooltipRed + "]their body heals at a much slower rate, and they are highly susceptible to fire[/color], a devastating weakness. Also, the bearer\'s morale is forever stunted, [color=" + this.Const.UI.Color.povTooltipRed + "]unable to feel the strength of confidence[/color]. A sinister transformation for those who seek endurance through sacrifice.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_skele.png";
		this.m.Value = 500;
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
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Skeleton);
	}
});

