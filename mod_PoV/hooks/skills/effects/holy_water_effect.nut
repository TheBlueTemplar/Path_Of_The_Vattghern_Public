::TLW.HooksMod.hook("scripts/skills/effects/holy_water_effect", function (q) {

	q.applyDamage = @(__original) function (_dropIcon = true)
	{
		if (this.m.LastRoundApplied != this.Time.getRound())
		{
			this.m.LastRoundApplied = this.Time.getRound();
			local actor = this.getContainer().getActor();

			if (!actor.isHiddenToPlayer())
			{
				if (_dropIcon)
				{
					this.spawnIcon(this.m.Overlay, this.getContainer().getActor().getTile());
				}

				if (this.m.SoundOnUse.len() != 0)
				{
					this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.2, actor.getPos());
				}

				for( local i = 0; i < this.Const.Tactical.AcidParticles.len(); i = ++i )
				{
					this.Tactical.spawnParticleEffect(true, this.Const.Tactical.AcidParticles[i].Brushes, this.getContainer().getActor().getTile(), this.Const.Tactical.AcidParticles[i].Delay, this.Const.Tactical.AcidParticles[i].Quantity, this.Const.Tactical.AcidParticles[i].LifeTimeQuantity, this.Const.Tactical.AcidParticles[i].SpawnRate, this.Const.Tactical.AcidParticles[i].Stages);
				}
			}

			// damage = 10-20 + 10% of targets max HP
			// Example: 100hp enemy will take 20-30 dmg 200 hp enemy 30-40 etc.
			local baseDamage = this.Math.rand(10,20);
			local bonusDamage = actor.getHitpointsMax() * 0.10;
			local totalDamage = baseDamage + bonusDamage;

			local hitInfo = clone this.Const.Tactical.HitInfo;
			hitInfo.DamageRegular = totalDamage;
			hitInfo.DamageDirect = 1.0;
			hitInfo.BodyPart = this.Const.BodyPart.Body;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 0.0;
			this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);

			if (--this.m.TurnsLeft <= 0)
			{
				this.removeSelf();
			}
		}
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.Vision += -1;
		_properties.RangedSkillMult *= 0.85;
		_properties.RangedDefenseMult *= 0.85;
		_properties.MeleeSkillMult *= 0.85;
		_properties.MeleeDefenseMult *= 0.85;
		_properties.InitiativeMult *= 0.85;
		_properties.BraveryMult *= 0.85;
		//_properties.StaminaMult *= 0.85;
	}

});

