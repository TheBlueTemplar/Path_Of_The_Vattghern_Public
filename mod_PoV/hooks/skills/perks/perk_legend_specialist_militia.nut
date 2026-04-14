::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_militia", function ( q ) {

	q.m.BonusMelee = 10;
	q.m.BonusDamage = 8;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_militia_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_militia.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_militia_bw.png";
	}

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
				if (actor.getBackground() != null)
				{	
					actor.getBackground().m.Modifiers.Training += 0.10;
					//actor.getBackground().onAdded();
				}
			}	
		}
	}

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
			return;
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != actor.getID())
			{
				_properties.DamageTotalMult *= 1.0 + 0.01 * this.calculateSpecialistBonus(15, _skill.getItem());
			}
		}
	}
});