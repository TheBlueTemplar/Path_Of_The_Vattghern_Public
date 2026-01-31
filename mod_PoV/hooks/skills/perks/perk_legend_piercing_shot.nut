::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_piercing_shot", function ( q ) {

	q.onAfterUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		/*local skill = ::Legends.Actives.get(this, ::Legends.Active.FireHandgonne);
		if (skill != null)
		{
			skill.m.MaxRange += this.m.BonusRange;
			// The getTooltip() function in fire_handgonne_skill has logic to display this bonus
		}*/
		local actor = this.getContainer().getActor();
		local skill;
		if (actor != null && actor.getSkills().hasSkill("actives.pov_fire_handgonne"))
		{
			skill = actor.getSkills().getSkillByID("actives.pov_fire_handgonne");
			skill.m.MaxRange += this.m.BonusRange;
			// The getTooltip() function in fire_handgonne_skill has logic to display this bonus
		}
	}
});