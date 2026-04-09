this.pov_specialist_spearfisher_perk <- this.inherit("scripts/skills/pov_specialist_abstract", {
	m = {
		FreeNet = false,
		SpecialistWeaponIds = [
			"weapon.javelin",
			"weapon.named_javelin"
		],
		ApplicableWeaponTypes = [
			this.Const.Items.WeaponType.Throwing
		],
		ExcludedItemTypes = [
			this.Const.Items.ItemType.MeleeWeapon
		],
		BonusRanged = 10,
		BonusDamage = 10
	},
	function create()
	{
		this.pov_specialist_abstract.create();
		::Legends.Perks.onCreate(this, ::Legends.Perk.PovSpecialistSpearfisher);
		this.m.IconMini = "pov_perk_spec_javelin_mini";
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill == null)
			return;

		if (_skill.getID() == ::Legends.Actives.getID(::Legends.Active.ThrowNet))
		{
			this.m.FreeNet = false;
			return;
		}
		local item = _skill.getItem();

		if (::Legends.S.isNull(item))
			return;
		if (!item.isItemType(this.Const.Items.ItemType.Weapon))
			return;
		if (!item.isWeaponType(this.Const.Items.WeaponType.Throwing))
			return;

		this.m.FreeNet = true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.pov_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (this.onAnySkillUsedSpecialistChecks(_skill))
			_properties.DamageRegularMin += 0.01 * this.calculateSpecialistBonus(6, _skill.getItem());
	}

	function onCombatFinished()
	{
		this.m.FreeNet = false;
	}
});
