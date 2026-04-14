::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_farmhand", function ( q ) {

	q.m.BonusMelee = 10;
	q.m.BonusDamage = 10;

	q.create = @(__original) function()
	{
		__original();

		this.m.IconMini = "pov_perk_spec_bitchfork_mini";
		this.m.Icon = "ui/perks/pov_perk_spec_bitchfork.png";
		this.m.IconDisabled = "ui/perks/pov_perk_spec_bitchfork_bw.png";
	}

	q.onAdded = @(__original) function()
	{
		__original();
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if(::World.State.getPlayer() != null)
		{
			// +1%
			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				actor.getBackground().m.Modifiers.Terrain[11] += 0.0100;
			}
		}
	}

	q.onAnySkillUsed = @(__original) function(_skill, _targetEntity, _properties)
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			_properties.DamageArmorMult += 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
			_properties.HitChance[this.Const.BodyPart.Head] += this.calculateSpecialistBonus(5, _skill.getItem());
		}	
	}
});