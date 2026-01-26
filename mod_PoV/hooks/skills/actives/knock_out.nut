::TLW.HooksMod.hook("scripts/skills/actives/knock_out", function ( q ) {

	q.m.IsHeavyGun <- false;

	q.setItem = @(__original) function(_item)
	{
		__original(_item);
		if (this.m.IsRangedKnockOut)
		{
			this.m.Name = "Improvised Strike";
			this.m.Description = "Use the butt of your ranged weapon to hit the target. Causes moderate damage, and might get the user out of a tricky situation.";
		}
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		if (this.m.IsRangedKnockOut && _skill == this)
		{
			if (this.m.IsHeavyGun)
			{
				_properties.DamageTotalMult *= 0.60; // see dmg min and max below if you change this
				_properties.FatigueDealtPerHitMult += 2.0;
				_properties.DamageArmorMult = 1.50;
				_properties.DamageRegularMin += _properties.IsSpecializedInCrossbows ? 9 : 0; // +~5 actual dmg
				_properties.DamageRegularMax += _properties.IsSpecializedInCrossbows ? 17 : 0; // +~10 actual dmg
			}else
			{
				_properties.DamageTotalMult *= 0.45; // see dmg min and max below if you change this
				_properties.FatigueDealtPerHitMult += 2.0;
				_properties.DamageArmorMult = 1.10;
				_properties.DamageRegularMin += _properties.IsSpecializedInCrossbows ? 12 : 0; // +~5 actual dmg
				_properties.DamageRegularMax += _properties.IsSpecializedInCrossbows ? 23 : 0; // +~10 actual dmg
			}
			this.m.FatigueCostMult = _properties.IsSpecializedInCrossbows ? 0.70 : 1.00; // 50% total reduction, due to xbow specialization
		}
		else
		{
			__original(_skill, _targetEntity, _properties);
		}
	}

});	

//dont know how this will work with legends' hook, but should be okay, maybe
//bless u pot, used this shet for sth else
//Im just copying that shit over files arent I? xd