::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_blacksmith", function ( q ) {

	q.m.BonusMelee = 10;
	q.m.BonusDamage = 10;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_blacksmith_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_smith.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_smith_bw.png";
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
					actor.getBackground().m.Modifiers.Repair += 0.05;
					actor.getBackground().m.Modifiers.Salvage += 0.05;
					//actor.getBackground().onAdded();
				}
			}	
		}
	}

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageArmorMult += 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
	}
});