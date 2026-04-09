this.pov_specialist_blacksmith_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.legend_hammer",
			"weapon.legend_named_blacksmith_hammer"
		],
		ApplicableItemTypes = [
			this.Const.Items.ItemType.OneHanded
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Hammer
		],
		BonusMelee = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistBlacksmith);
		this.m.IconMini = "pov_perk_spec_blacksmith_mini";
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
					actor.getBackground().m.Modifiers.Repair += 0.05;
					actor.getBackground().m.Modifiers.Salvage += 0.05;
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
