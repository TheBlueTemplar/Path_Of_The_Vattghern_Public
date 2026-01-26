::TLW.HooksMod.hook("scripts/skills/actives/fire_mortar_skill", function ( q ) {

	q.onImpact = @(__original) function( _tag )
	{	
		//__original(_tag); overwrite
		this.Tactical.EventLog.log("A mortar shell impacts on the battlefield");
		this.Tactical.getCamera().quake(this.createVec(0, -1.0), 6.0, 0.16, 0.35);

		for( local i = 0; i < this.Const.Tactical.MortarImpactParticles.len(); i = ++i )
		{
			local effect = this.Const.Tactical.MortarImpactParticles[i];
			this.Tactical.spawnParticleEffect(false, effect.Brushes, _tag.m.AffectedTiles[0], effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
		}

		foreach( t in _tag.m.AffectedTiles )
		{
			t.clear(this.Const.Tactical.DetailFlag.SpecialOverlay);
			t.Properties.IsMarkedForImpact = false;

			if (t.IsOccupiedByActor)
			{
				local target = t.getEntity();

				if (target.getMoraleState() != this.Const.MoraleState.Ignore)
				{
					target.checkMorale(-1, 0);
					target.getSkills().add(this.new("scripts/skills/effects/shellshocked_effect"));
				}

				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = this.Math.rand(35, 70); // dmg increased by 15 - 30
				hitInfo.DamageArmor = hitInfo.DamageRegular * 1.4; // 50-100 armor dmg
				hitInfo.DamageDirect = 0.25; // +0.05 direct dmg, should be 10 - 17
				hitInfo.BodyPart = 0;
				hitInfo.FatalityChanceMult = 0.0;
				hitInfo.Injuries = this.Const.Injury.BurningAndPiercingBody;
				target.onDamageReceived(null, this, hitInfo);
			}

			if (t.Type != this.Const.Tactical.TerrainType.ShallowWater && t.Type != this.Const.Tactical.TerrainType.DeepWater)
			{
				t.clear(this.Const.Tactical.DetailFlag.Scorchmark);
				t.spawnDetail("impact_decal", this.Const.Tactical.DetailFlag.Scorchmark, false, true);
			}
		}

		_tag.m.AffectedTiles = [];
	}

});	