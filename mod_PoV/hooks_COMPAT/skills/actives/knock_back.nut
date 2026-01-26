::TLW.HooksMod.hook("scripts/skills/actives/knock_back", function ( q ) {

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		__original( _skill, _targetEntity, _properties );
		
		if (_skill != this)
			return;

		if (_properties.IsSpecializedInShields)
			this.m.HitChanceBonus += 15;

		if (this.getContainer().hasPerk(::Legends.Perk.ShieldBash))
		{
			local actor = this.getContainer().getActor();
			local item = actor.getOffhandItem();
			local shieldBonus = this.Math.min(15, item == null ? 0 : this.Math.floor(item.m.ConditionMax * 0.20));
			_properties.DamageRegularMin = 10 + shieldBonus;
			_properties.DamageRegularMax = 25 + shieldBonus;
			_properties.DamageTotalMult *= _properties.IsSpecializedInShields ? 1.20 : 1.00;
			_properties.DamageArmorMult = 0.9;
			_properties.DamageDirectMult = 0.3;
			_properties.FatigueDealtPerHitMult += 1.0;
		}
	}

});	