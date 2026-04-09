this.pov_specialist_shepherd_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.legend_dilapitated_sling",
			"weapon.legend_slingshot",
			"weapon.legend_sturdy_sling"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Sling
		],
		BonusRanged = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistShepherd);
		this.m.IconMini = "pov_perk_spec_sling_mini";
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
					actor.getBackground().m.Modifiers.Scout += 0.05;
					//actor.getBackground().onAdded();
				}
			}	
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageArmorMult += 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
	}
});
