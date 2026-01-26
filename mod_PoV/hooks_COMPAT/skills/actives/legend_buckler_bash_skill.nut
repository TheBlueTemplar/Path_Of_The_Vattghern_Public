::TLW.HooksMod.hook("scripts/skills/actives/legend_buckler_bash_skill", function ( q ) {

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		__original( _skill, _targetEntity, _properties );
		
		if (_skill == this)
		{
			_properties.DamageRegularMin = 5;
			_properties.DamageRegularMax = 10;
			_properties.FatigueDealtPerHitMult += 1.0;
			if (this.getContainer().hasPerk(::Legends.Perk.ShieldBash))
			{
				local actor = this.getContainer().getActor();
				local item = actor.getOffhandItem();
				local shieldBonus = this.Math.min(15, item == null ? 0 : this.Math.floor(item.m.ConditionMax * 0.20));
				_properties.DamageRegularMin = 10 + shieldBonus;
				_properties.DamageRegularMax = 15 + shieldBonus;
				_properties.DamageArmorMult = 1.15;
			}
			_properties.DamageTotalMult *= _properties.IsSpecializedInShields ? 1.20 : 1.00;
		}

	}

});	