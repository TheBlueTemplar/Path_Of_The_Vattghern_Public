::TLW.HooksMod.hook("scripts/skills/actives/legend_kick_skill", function ( q ) {

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		if (_skill == this)
		{
			// Overwriting Legends
			_properties.MeleeSkill += 25;
			_properties.DamageRegularMin = 0;
			_properties.DamageRegularMax = 0;
			_properties.DamageArmorMult = 0.0;

			if (_properties.IsSpecializedInFists)
			{
				_properties.MeleeSkill += 15;
				this.m.HitChanceBonus += 15;
			}

			if (::Legends.Perks.has(this, ::Legends.Perk.LegendPugilist))
			{
				local actor = this.getContainer().getActor();
				local p = actor.getCurrentProperties();
				local mult = p.DamageTotalMult;
				local armor = actor.getArmor(this.Const.BodyPart.Body);
				local modifier = armor * 0.1; // +10 dmg per 100 current armor
				local damageMin = 5;
				local damageMax = 10;

				// Example: on 300 Armor: damage = 35 - 40 (26 - 30 on armor)
				if (modifier >= 5)
				{
					damageMin += modifier;
					damageMax += modifier;
				}

				// Hardcap on 450 Armor.
				if (damageMin > 50) {damageMin = 50;}
				if (damageMax > 55) {damageMax = 55;}

				_properties.DamageRegularMin = this.Math.floor(damageMin);
				_properties.DamageRegularMax = this.Math.floor(damageMax);
				//_properties.HitChance[this.Const.BodyPart.Head] += 15.0;
				_properties.DamageArmorMult = 0.75;
			}
		}
	}

});	