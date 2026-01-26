this.pov_reader_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_reader";
		this.m.Name = "Learned to Read";
		this.m.Icon = "ui/traits/pov_reader.png";
		this.m.Description = "After lots of effort and guidance, %name% has learned how to read, and can benefit from a skill book. This may also help with other taks, generally allowing faster growth";
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
				icon = "ui/icons/scroll_01.png",
				text = "Can [color=" + this.Const.UI.Color.PositiveValue + "]read[/color] Books"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3%[/color] Experience Gain"
			}
		];
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (!actor.getFlags().has("PovCanRead"))
		{
			actor.getFlags().add("PovCanRead");
		}
	}
	
	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 1.03;
	}

});

