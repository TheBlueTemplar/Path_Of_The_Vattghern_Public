this.pov_specialist_militia_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		SpecialistWeaponIds = [
			"weapon.militia_spear",
			"weapon.legend_wooden_spear",
			"weapon.ancient_spear"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Spear
		],
		ExcludedItemTypes = [
			this.Const.Items.ItemType.RangedWeapon
		],
		BonusMelee = 10,
		BonusDamage = 8
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistMilitia);
		this.m.IconMini = "pov_perk_spec_militia_mini";
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
					actor.getBackground().m.Modifiers.Training += 0.10;
					//actor.getBackground().onAdded();
				}
			}	
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
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
