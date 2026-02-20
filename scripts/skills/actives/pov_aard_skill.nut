this.pov_aard_skill <- this.inherit("scripts/skills/skill", {
	m = {},

	function create()
	{
		this.m.ID = "actives.pov_aard";
		this.m.Name = "Aard Sign";
		this.m.Description = "With a powerful gesture push a strong gust of air on the enemy, throwing them off balance and causing minor injury. Perfect to clear some space! \n\n Vattghern signs have a base cooldown of 2 turns (shared among all of them). Sign intensity affects this sign\'s damage and knockback/stagger chance.";
		this.m.Icon = "skills/pov_active_aard.png";
		this.m.IconDisabled = "skills/pov_active_aard_sw.png";
		this.m.Overlay = "pov_active_aard";
		this.m.SoundOnUse = [
			"sounds/combat/dlc6/fire_lance_01.wav",
			"sounds/combat/dlc6/fire_lance_02.wav",
			"sounds/combat/dlc6/fire_lance_03.wav",
			"sounds/combat/dlc6/fire_lance_04.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc6/fire_hit_01.wav",
			"sounds/combat/dlc6/fire_hit_02.wav",
			"sounds/combat/dlc6/fire_hit_03.wav",
			"sounds/combat/dlc6/fire_hit_04.wav",
			"sounds/combat/dlc6/fire_hit_05.wav",
			"sounds/combat/dlc6/fire_hit_06.wav"
		];

		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 2000;

		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsTargetingActor = false;
		this.m.IsAOE = true;

		//this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;

		this.m.DirectDamageMult = 0.20;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();

		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local knockChance = 30 + intensity * 1.0; // e.g. 30% base + 1% per intensity
		local staggerChance = 40 + intensity * 1.0; // e.g. 40% base + 1% per intensity

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/pov_intensity.png",
			text = "Current Sign Intensity: [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(intensity) + "%[/color]."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Hits have [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(knockChance) + "%[/color] chance of knocking the enemy back, and [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(staggerChance) + "%[/color] chance of [color=" + this.Const.UI.Color.PositiveValue + "]Staggering[/color] them. Both chances increased by 1% for each point of Sign intensity."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Is considered a melee attack. Can hit up to 6 targets"
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Uses either Melee or Ranged Skill to calculate hitchance, whichever is higher."
		});

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/hitchance.png",
			text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] chance to hit"
		});

		return ret;
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();
		return (!actor.getSkills().hasSkill("effects.pov_sign_cooldown") && this.skill.isUsable());
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInSigns ? 0.75 : 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInSigns ? 3 : 4;
	}
	
	function onUse( _user, _targetTile )
	{
		local tag = {
			Skill = this,
			User = _user,
			TargetTile = _targetTile
		};

		this.Time.scheduleEvent(
			this.TimeUnit.Virtual,
			500,
			this.onDelayedEffect.bindenv(this),
			tag
		);

		return true;
	}

	// Vanilla handgonne-style AoE
	function wrapDir( d )
	{
		local c = this.Const.Direction.COUNT;
		d = d % c;
		if (d < 0) d += c;
		return d;
	}

	// EXACT same shape logic as vanilla handgonne (but with height diff <= 1 like old Aard)
	// Returns TILES 
	function getAffectedTiles( _targetTile )
	{
		local ret = [ _targetTile ];
		local ownTile = this.m.Container.getActor().getTile();
		local dir = ownTile.getDirectionTo(_targetTile);

		// forward from target
		if (_targetTile.hasNextTile(dir))
		{
			local forwardTile = _targetTile.getNextTile(dir);
			if (this.Math.abs(forwardTile.Level - ownTile.Level) <= 1)
			{
				ret.push(forwardTile);
			}
		}

		local left = this.wrapDir(dir - 1);

		if (_targetTile.hasNextTile(left))
		{
			local t = _targetTile.getNextTile(left);

			if (this.Math.abs(t.Level - ownTile.Level) <= 1)
			{
				ret.push(t);
			}

			if (t.hasNextTile(dir))
			{
				local t2 = t.getNextTile(dir);
				if (this.Math.abs(t2.Level - ownTile.Level) <= 1)
				{
					ret.push(t2);
				}
			}
		}

		local right = this.wrapDir(dir + 1);

		if (_targetTile.hasNextTile(right))
		{
			local t = _targetTile.getNextTile(right);

			if (this.Math.abs(t.Level - ownTile.Level) <= 1)
			{
				ret.push(t);
			}

			if (t.hasNextTile(dir))
			{
				local t2 = t.getNextTile(dir);
				if (this.Math.abs(t2.Level - ownTile.Level) <= 1)
				{
					ret.push(t2);
				}
			}
		}

		return ret;
	}

	// Apply attacks to a list of TILES (vanilla handgonne approach)
	function applyEffectToTargets( _tag )
	{
		if (_tag == null) return; //fallback
		
	    local user = ("User" in _tag) ? _tag.User : null;
	    local targets = ("Targets" in _tag) ? _tag.Targets : null;

	    // User might have died in the 200ms delay
	    if (user == null || !user.isAlive() || user.isDying())
	        return;

	    if (targets == null || typeof targets != "array" || targets.len() == 0)
	        return;

		foreach (t in tiles)
		{
			if (t == null) continue;
			if (!t.IsOccupiedByActor) continue;

			local ent = t.getEntity();
			if (ent == null || !ent.isAttackable()) continue;
			if (!ent.isAlive() || ent.isDying()) continue;

			this.attackEntity(user, ent, false);
		}
	}

	function onDelayedEffect( _tag )
	{
		local user = _tag.User;
		local targetTile = _tag.TargetTile;

		if (user == null || !user.isAlive() || user.isDying() || targetTile == null)
			return false;

		local myTile = user.getTile();
		if (myTile == null)
			return false;

		local dir = myTile.getDirectionTo(targetTile);

		// PARTICLES: DO NOT CHANGE
		local particleSet = this.getSweepParticleSetByDir(dir);

		if (myTile.IsVisibleForPlayer)
		{
			for (local i = 0; i < particleSet.len(); i = ++i)
			{
				local effect = particleSet[i];
				this.Tactical.spawnParticleEffect(
					false,
					effect.Brushes,
					myTile,
					effect.Delay,
					effect.Quantity,
					effect.LifeTimeQuantity,
					effect.SpawnRate,
					effect.Stages,
					this.createVec(0, 0)
				);
			}
		}

		// Vanilla handgonne AoE tiles
		local affectedTiles = this.getAffectedTiles(targetTile);

		// Optional: play hit sound at the moment the fire goes off
		this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], 1.0, user.getPos());

		// Schedule applying damage/effects
		local tag2 = {
			User = user,
			Targets = affectedTiles
		};

		this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, this.applyEffectToTargets.bindenv(this), tag2);

		return true;
	}

	function onTargetSelected( _targetTile )
	{
		local affectedTiles = this.getAffectedTiles(_targetTile);

		foreach (t in affectedTiles)
		{
			if (t == null) continue;

			this.Tactical.getHighlighter().addOverlayIcon(
				this.Const.Tactical.Settings.AreaOfEffectIcon,
				t,
				t.Pos.X,
				t.Pos.Y
			);
		}
	}

	function getSweepParticleSetByDir(_dir)
	{
		// Directions start counting clockwise, from on top entity
		// 0 - Top, 1 - FrontTop, 2 - FrontBottom, 3 - Bottom, 4 - BackBottom, 5 - BackFront
		switch (_dir)
		{
			case 0: return this.Const.Tactical.AirSweepTopParticles; break
			case 1: return this.Const.Tactical.AirSweepRightParticles; break
			case 2: return this.Const.Tactical.AirSweepRightParticles; break
			case 3: return this.Const.Tactical.AirSweepBottomParticles; break
			case 4: return this.Const.Tactical.AirSweepLeftParticles; break
			case 5: return this.Const.Tactical.AirSweepLeftParticles; break
		}

		return this.Const.Tactical.FireSweepRightParticles;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();
		local intensity = 1 + actor.getCurrentProperties().SignIntensity;

		if (_skill == this)
		{
			// Hit Chance Mod
			_properties.MeleeSkill -= 10;
			_properties.RangedSkill -= 10;

			// Skill Stats
			_properties.DamageRegularMin = 15 * intensity;
			_properties.DamageRegularMax = 25 * intensity;
			_properties.DamageArmorMult = 1.25;

			// Use whichever is higher
			if (_properties.MeleeSkill < _properties.RangedSkill)
			{
				_properties.MeleeSkill = _properties.RangedSkill;
			}
		}
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{
		local dir = _userTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local knockToTile = _targetTile.getNextTile(dir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		local altdir = dir - 1 >= 0 ? dir - 1 : 5;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		altdir = dir + 1 <= 5 ? dir + 1 : 0;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		return null;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill == this)
		{
			// Sign Cooldown
			local actor = this.getContainer().getActor();
			actor.getSkills().add(this.new("scripts/skills/effects/pov_sign_cooldown_effect"));
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill != this) return;
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying()) return;

		// KNOCKBACK (chance-based)
		local user = this.getContainer().getActor();
		if (user != null && !_targetEntity.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			// scale with sign intensity (uncomment if you want):
			local intensity = 100 * user.getCurrentProperties().SignIntensity;
			local knockChance = 30 + intensity * 1.0; // e.g. 30% base + 1% per intensity
			// fallbacks
			if (knockChance > 100) knockChance = 100;
			if (knockChance < 1) knockChance = 1;
			//knockChance = 100; // test

			if (this.Math.rand(1, 100) <= knockChance)
			{
				local userTile = user.getTile();
				local targetTile = _targetEntity.getTile();

				if (userTile != null && targetTile != null)
				{
					local knockToTile = this.findTileToKnockBackTo(userTile, targetTile);

					if (knockToTile != null)
					{
						if (!user.isHiddenToPlayer() && (targetTile.IsVisibleForPlayer || knockToTile.IsVisibleForPlayer))
						{
							this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " has knocked back " + this.Const.UI.getColorizedEntityName(_targetEntity));
						}

						local skills = _targetEntity.getSkills();
						skills.removeByID("effects.shieldwall");
						skills.removeByID("effects.spearwall");
						skills.removeByID("effects.riposte");

						_targetEntity.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
						this.Tactical.getNavigator().teleport(_targetEntity, knockToTile, null, null, true);
					}
				}
			}
		}

		// STAGGER CHANCE
		local intensity = 100 * user.getCurrentProperties().SignIntensity;
		local staggerChance = 40 + intensity * 1.0; // e.g. 40% base + 1% per intensity
		// fallbacks
		if (staggerChance > 100) staggerChance = 100;
		if (staggerChance < 1) staggerChance = 1;
		//staggerChance = 100; // test

		if (this.Math.rand(0, 100) < staggerChance)
		{
			if (!_targetEntity.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " got staggered!");
			}

			local effect = this.new("scripts/skills/effects/staggered_effect");
			_targetEntity.getSkills().add(effect);
		}
	}

});
