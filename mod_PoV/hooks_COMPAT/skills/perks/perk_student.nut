::TLW.HooksMod.hook("scripts/skills/perks/perk_student", function ( q ) {

	q.onAdded = @(__original) function()
	{
		__original();
		if(::World.State.getPlayer() != null)
		{
			local actor = this.getContainer().getActor();
			if (actor.getFaction() == this.Const.Faction.Player)
			{
				if (actor.getSkills().hasTrait(::Legends.Trait.Dumb) || actor.getSkills().hasSkill("injury.brain_damage") || actor.getBackground().getID() == "background.wildman")
				{
					return;
				}

				if(!actor.getFlags().has("PovCanRead"))
				{
					actor.getSkills().add(this.new("scripts/skills/effects/pov_learning_to_read_effect"));
				}
			}	
			
		}
	}

});