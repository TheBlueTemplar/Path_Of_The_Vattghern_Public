this.pov_corpse_explosion_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 0
	},
	function create()
	{
		this.m.ID = "actives.pov_corpse_explosion";
		this.m.Name = "Corpse Explosion";
		this.m.Description = "Makes a selected corpse explode, dealing damage to anyone near it and causing a miasma to spread.\n\n 2 Turns Cooldown.";
		this.m.Icon = "skills/pov_active_corpse_explosion.png";
		this.m.IconDisabled = "skills/pov_active_corpse_explosion_sw.png";
		this.m.Overlay = "pov_active_corpse_explosion";
		this.m.SoundOnUse = [
			"sounds/enemies/corpse_explosion_01.wav",
			"sounds/enemies/corpse_explosion_02.wav",
			"sounds/enemies/corpse_explosion_03.wav",
			"sounds/enemies/corpse_explosion_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 2000;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 99;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Explosion deals [color=" + this.Const.UI.Color.NegativeValue + "]30 - 60[/color] Damage, of which [color=" + this.Const.UI.Color.NegativeValue + "]0 - 9[/color] can ignore armor. Deals [color=" + this.Const.UI.Color.NegativeValue + "]38 - 75[/color] Damage to armor."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/pov_fire.png",
				text = "Damage dealt is considered as [color=" + this.Const.UI.Color.NegativeValue + "]Fire[/color] Damage."
			}

		];

		if (this.m.Cooldown >= 1)
		{
			ret.push(
				{
					id = 7,
					type = "hint",
					icon = "ui/icons/warning.png",
					text = "Skill is on cooldown. Turns remaining: [color=" + this.Const.UI.Color.NegativeValue + "]"+this.m.Cooldown+"[/color]"
				}
			);
		}

		return ret;
	}

	function onTurnStart()
	{
		this.m.Cooldown = this.Math.max(0, this.m.Cooldown - 1);
	}

	function isUsable()
	{
		return this.m.Cooldown == 0 && this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local isFleshCradle = _targetTile.getEntity() != null && _targetTile.getEntity().getType() == this.Const.EntityType.FleshCradle && !_targetTile.getEntity().getIsDestroyed();

		if ((!_targetTile.IsCorpseSpawned || !_targetTile.Properties.get("Corpse").IsConsumable) && !isFleshCradle)
		{
			return false;
		}

		return true;
	}

	function spawnBloodbath( _targetTile )
	{
		for( local i = 0; i != this.Const.CorpsePart.len(); i = ++i )
		{
			_targetTile.spawnDetail(this.Const.CorpsePart[i]);
		}

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = _targetTile.getNextTile(i);

				for( local n = this.Math.rand(0, 4); n != 0; n = --n )
				{
					local decal = this.Const.BloodDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Red].len() - 1)];
					tile.spawnDetail(decal);
				}
			}
		}

		for( local n = 2; n != 0; n = --n )
		{
			local decal = this.Const.BloodDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Red].len() - 1)];
			_targetTile.spawnDetail(decal);
		}
	}

	function onRemoveCorpse( _tile )
	{
		this.Tactical.Entities.removeCorpse(_tile);
		_tile.clear(this.Const.Tactical.DetailFlag.Corpse);
		_tile.Properties.remove("Corpse");
		_tile.Properties.remove("IsSpawningFlies");
	}

	function onDestroyFleshCradle( _data )
	{
		_data.FleshCradle.setDestroyed(true);
	}

	function onUse( _user, _targetTile )
	{
		local isFleshCradle = _targetTile.getEntity() != null && _targetTile.getEntity().getType() == this.Const.EntityType.FleshCradle && !_targetTile.getEntity().getIsDestroyed();

		if (isFleshCradle)
		{
			this.Time.scheduleEvent(this.TimeUnit.Real, 250, this.onDestroyFleshCradle.bindenv(this), {
				FleshCradle = _targetTile.getEntity()
			});
		}
		else
		{
			this.onRemoveCorpse(_targetTile);
		}

		this.Time.scheduleEvent(this.TimeUnit.Real, 250, this.onApply.bindenv(this), {
			Skill = this,
			TargetTile = _targetTile,
			User = _user
		});
		this.m.Cooldown = 1;
		return true;
	}

	function onApply( _data )
	{
		this.spawnBloodbath(_data.TargetTile);
		local isFleshCradle = _data.TargetTile.getEntity() != null && _data.TargetTile.getEntity().getType() == this.Const.EntityType.FleshCradle && !_data.TargetTile.getEntity().getIsDestroyed();

		if (!_data.User.isHiddenToPlayer() || _data.TargetTile.IsVisibleForPlayer)
		{
			if (isFleshCradle)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_data.User) + " causes a flesh cradle to explode!");
			}
			else
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_data.User) + " causes a corpse to explode!");
			}

			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill * 1.2, _data.User.getPos());
			}
		}

		local targets = [];
		targets.push(_data.TargetTile);

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_data.TargetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = _data.TargetTile.getNextTile(i);
				targets.push(tile);
			}
		}

		local p = {
			Type = "miasma",
			Tooltip = "Miasma lingers here, harmful to any living being",
			IsPositive = false,
			IsAppliedAtRoundStart = false,
			IsAppliedAtTurnEnd = true,
			IsAppliedOnMovement = false,
			IsAppliedOnEnter = false,
			IsByPlayer = false,
			Timeout = this.Time.getRound() + 3,
			Callback = this.Const.Tactical.Common.onApplyMiasma,
			function Applicable( _a )
			{
				return !_a.getFlags().has("undead");
			}

		};

		foreach( targetTile in targets )
		{
			if (targetTile.ID == _data.TargetTile.ID)
			{
				for( local i = 0; i < this.Const.Tactical.CorpseExplosionParticles.len(); i = ++i )
				{
					local effect = this.Const.Tactical.CorpseExplosionParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, targetTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
				}
			}
			else
			{
				for( local i = 0; i < this.Const.Tactical.CorpseExplosionOuterParticles.len(); i = ++i )
				{
					local effect = this.Const.Tactical.CorpseExplosionOuterParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, targetTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
				}
			}

			if (targetTile.IsOccupiedByActor && !targetTile.getEntity().getSkills().hasSkill("racial.grand_diviner") && targetTile.getEntity().getType() != this.Const.EntityType.FleshCradle)
			{
				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = targetTile.isSameTileAs(_data.TargetTile) ? this.Math.rand(30, 60) : this.Math.rand(25, 50);
				hitInfo.DamageArmor = hitInfo.DamageRegular * 1.25;
				hitInfo.DamageDirect = 0.15;
				hitInfo.BodyPart = 0;
				hitInfo.FatalityChanceMult = 0.0;
				hitInfo.Injuries = this.Const.Injury.BurningAndPiercingBody;
				targetTile.getEntity().onDamageReceived(null, this, hitInfo);
			}

			if (targetTile.Properties.Effect != null && targetTile.Properties.Effect.Type == "miasma")
			{
				targetTile.Properties.Effect.Timeout = this.Time.getRound() + 3;
			}
			else
			{
				if (targetTile.Properties.Effect != null)
				{
					this.Tactical.Entities.removeTileEffect(targetTile);
				}

				targetTile.Properties.Effect = clone p;
				local particles = [];

				for( local i = 0; i < this.Const.Tactical.MiasmaParticles.len(); i = ++i )
				{
					particles.push(this.Tactical.spawnParticleEffect(true, this.Const.Tactical.MiasmaParticles[i].Brushes, targetTile, this.Const.Tactical.MiasmaParticles[i].Delay, this.Const.Tactical.MiasmaParticles[i].Quantity, this.Const.Tactical.MiasmaParticles[i].LifeTimeQuantity, this.Const.Tactical.MiasmaParticles[i].SpawnRate, this.Const.Tactical.MiasmaParticles[i].Stages));
				}

				this.Tactical.Entities.addTileEffect(targetTile, targetTile.Properties.Effect, particles);
			}
		}
	}

});

