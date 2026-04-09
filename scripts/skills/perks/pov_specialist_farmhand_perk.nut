this.pov_specialist_farmhand_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistItemTypes = [
			this.Const.Items.ItemType.Pitchfork
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Polearm
		],
		BonusMelee = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistFarmhand);
		this.m.IconMini = "pov_perk_spec_bitchfork_mini";
	}

	function onAdded()
	{
		this.pov_specialist_abstract.onAdded();
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

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
		{
			_properties.DamageArmorMult += 0.01 * this.calculateSpecialistBonus(20, _skill.getItem());
			_properties.HitChance[this.Const.BodyPart.Head] += this.calculateSpecialistBonus(5, _skill.getItem());
		}		
	}
});
