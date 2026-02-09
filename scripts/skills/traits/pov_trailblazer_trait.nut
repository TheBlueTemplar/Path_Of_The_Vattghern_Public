this.pov_trailblazer_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_trailblazer";
		this.m.Name = "Trailblazer";
		this.m.Icon = "ui/traits/pov_trailblazer.png";
		this.m.Description = "This one is always up for a difficult hike. Their skills shining in terrains where others would rather not cross.";
		this.m.Titles = [
			"the Trailblazer",
			"the Trekker"
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
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+8%[/color] on all stats when fighting in [color=" + this.Const.UI.Color.PositiveValue + "]forests[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]mountains[/color]."
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
				actor.getBackground().m.Modifiers.Terrain[4] += 0.0200;
				actor.getBackground().m.Modifiers.Terrain[5] += 0.0200;
				actor.getBackground().m.Modifiers.Terrain[6] += 0.0200;
				actor.getBackground().m.Modifiers.Terrain[7] += 0.0200;
				actor.getBackground().m.Modifiers.Terrain[8] += 0.0200;
				actor.getBackground().m.Modifiers.Terrain[9] += 0.0200;
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

		local isTrailblazing = false;

		if (this.World.State.getPlayer() != null)
		{
			local currentTile = this.World.State.getPlayer().getTile();
			if (currentTile.Type == this.Const.World.TerrainType.Forest || currentTile.Type == this.Const.World.TerrainType.LeaveForest || currentTile.Type == this.Const.World.TerrainType.AutumnForest || currentTile.Type == this.Const.World.TerrainType.SnowyForest || currentTile.Type == this.Const.World.TerrainType.Hills || currentTile.Type == this.Const.World.TerrainType.Mountains)
			{
				isTrailblazing = true;
			}
		}		

		if (isTrailblazing)
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
