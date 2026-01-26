::TLW.HooksMod.hook("scripts/skills/perks/perk_pathfinder", function ( q ) {

	q.onAdded = @(__original) function()
	{
		__original();
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if(::World.State.getPlayer() != null)
		{
			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				actor.getBackground().m.Modifiers.Terrain[3] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[4] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[5] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[6] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[7] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[8] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[9] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[12] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[13] += 0.0075;
				actor.getBackground().m.Modifiers.Terrain[17] += 0.0075;
			}
		}
	}

});