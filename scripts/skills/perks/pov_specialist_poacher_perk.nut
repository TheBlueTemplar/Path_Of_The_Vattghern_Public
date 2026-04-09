this.pov_specialist_poacher_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.wonky_bow",
			"weapon.short_bow",
			"weapon.goblin_bow"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Bow
		],
		ValidEntities = [
			this.Const.EntityType.Wolf,
			this.Const.EntityType.Hyena
		],
		BonusRanged = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistPoacher);
		this.m.IconMini = "pov_perk_spec_shortbow_mini";
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
					actor.getBackground().m.Modifiers.Hunting += 0.05;
					//actor.getBackground().onAdded();
				}
			}	
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageRegularMin += 0.01 * this.calculateSpecialistBonus(10, _skill.getItem());
	}

});
