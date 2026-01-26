this.pov_basilisk_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_basilisk_mutagen";
		this.m.Name = "Mutagen: Basilisk";
		this.m.Description = "This mutagen, from the corpse of a basilisk, allows whomever drinks it to gain some of its powers.\n\n This mutation [color=" + this.Const.UI.Color.povTooltipRed + "]improves the Vatt\'ghern\'s ability to strike an opponent\'s head, and inflict more damage to it[/color]. \n\n The Vatt\'ghern also gets a [color=" + this.Const.UI.Color.povTooltipRed + "]stamina regeneration effect when striking a headshot[/color], and also gains the [color=" + this.Const.UI.Color.povTooltipRed + "]Glare skill[/color], a medium range attack, which Paralyzes an enemy. \n\n This mutation also has some side effects, with signs showing an [color=" + this.Const.UI.Color.povTooltipRed + "]increaded demand of stamina for any action[/color], due to the increased focus of the Vatt\'ghern, while also [color=" + this.Const.UI.Color.povTooltipRed + "]reducing the damage output on an enemy\'s body[/color]";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_basilisk.png";
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
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Basilisk);
	}

});

