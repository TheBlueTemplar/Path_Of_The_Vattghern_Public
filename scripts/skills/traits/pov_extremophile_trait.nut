this.pov_extremophile_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_extremophile";
		this.m.Name = "Extremophile";
		this.m.Icon = "ui/traits/pov_extremophile.png";
		this.m.Description = "This character thrives at extreme climates, be it bitter cold or searing heat.";
		this.m.Titles = [
			"the \"Extremist\"",
			"the Madlad"
		];
		this.m.Excluded = [
			"trait.weasel",
			"trait.gluttonous",
			"trait.fragile",
			"trait.fainthearted",
			"trait.fat",
			"trait.ailing",
			"trait.asthmatic",
			"trait.clubfooted",
			"trait.hesitant"
		];
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
				id = 13,
				type = "text",
				icon = "ui/icons/pov_extra_special.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+8%[/color] on all stats when fighting in [color=" + this.Const.UI.Color.PositiveValue + "]snow[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]deserts[/color]."
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Also grant [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] party movespeed on these same terrains"
			}
		];
	}

	function onAdded()
	{
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if(::World.State.getPlayer() != null)
		{
			// +2%
			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				actor.getBackground().m.Modifiers.Terrain[12] += 0.0150;
				actor.getBackground().m.Modifiers.Terrain[14] += 0.0150;
				actor.getBackground().m.Modifiers.Terrain[17] += 0.0150;
				actor.getBackground().m.Modifiers.Terrain[18] += 0.0150;
			}
		}
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}

		local isExtreming = false;

		if (this.World.State.getPlayer() != null)
		{
			local currentTile = this.World.State.getPlayer().getTile();
			if (currentTile.Type == this.Const.World.TerrainType.Tundra || currentTile.Type == this.Const.World.TerrainType.Snow || currentTile.Type == this.Const.World.TerrainType.Desert || currentTile.Type == this.Const.World.TerrainType.Oasis)
			{
				isExtreming = true;
			}
		}		

		if (isExtreming)
		{
			_properties.RangedSkillMult *= 1.08;
			_properties.RangedDefenseMult *= 1.08;
			_properties.MeleeSkillMult *= 1.08;
			_properties.MeleeDefenseMult *= 1.08;
			_properties.InitiativeMult *= 1.08;
			_properties.BraveryMult *= 1.08;
			_properties.StaminaMult *= 1.08;
			// Make this a status effect so it will be visible for the battle
			this.m.Type = ::Const.SkillType.StatusEffect;
		} else {
			// Make this a trait so it will not be visible for the battle
			this.m.Type = ::Const.SkillType.Trait;
		}
	}

});
