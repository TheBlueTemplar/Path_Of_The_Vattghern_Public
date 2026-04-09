this.pov_specialist_herbalist_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.sickle",
			"weapon.goblin_notched_blade",
			"weapon.legend_named_sickle"
		],
		ApplicableItemTypes = [
			this.Const.Items.ItemType.OneHanded
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Sword
		],
		BonusMelee = 10,
		BonusDamage = 12
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistHerbalist);
		this.m.IconMini = "pov_perk_spec_sickle_mini";
	}

	function onAdded()
	{
		this.pov_specialist_abstract.onAdded();
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if(::World.State.getPlayer() != null)
		{
			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				if (actor.getBackground() != null)
				{	
					actor.getBackground().m.Modifiers.Gather += 0.05;
					//actor.getBackground().onAdded();
				}
			}	
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill) && _properties.ThresholdToInflictInjuryMult != 1.0)
			_properties.DamageRegularMult *= 1.0 + 0.01 * this.calculateSpecialistBonus(25, _skill.getItem()) * (1.0 - _properties.ThresholdToInflictInjuryMult);
	}
});
