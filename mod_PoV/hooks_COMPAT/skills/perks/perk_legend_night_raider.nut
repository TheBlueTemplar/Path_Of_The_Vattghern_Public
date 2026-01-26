::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_night_raider", function ( q ) {

	q.onAdded = @(__original) function()
	{
		__original();
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if(::World.State.getPlayer() != null)
		{	
			local actor = this.getContainer().getActor();
			local badThing = actor.getSkills().getSkillByID("trait.pov_nyctophobia");
			if (badThing)
			{
				actor.getSkills().remove(badThing);
			}
		}
	}

});