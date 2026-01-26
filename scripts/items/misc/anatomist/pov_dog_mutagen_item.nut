this.pov_dog_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	// "Touch The Alps, they like it!"
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_dog_mutagen";
		this.m.Name = "Mutagen: Dog";
		this.m.Description = "The wisest of anatomists, the most knowledgable of researchers, the most powerful mages... None understand why this thing exists.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_dog.png";
		this.m.Value = 625;
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

		result.push({
			id = 65,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "Does not count to mutation limit"
		});

		return result;
	}

	function onUse( _actor, _item = null )
	{
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Dog);
	}

});

