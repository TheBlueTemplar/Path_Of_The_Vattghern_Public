this.pov_bront_skill <- this.inherit("scripts/skills/skill", {
	m = {
		LightningBounceNum = 1,
		MoraleCheckDifficulty = 1
	},
	function create()
	{
		// This file was taken from Rotu and tweaked for PoV, credits to Abysscrane
		this.m.ID = "actives.pov_bront";
		this.m.Name = "Bront Sign";
		this.m.Description = "Cast thunder upon your enemies from the palm of your hand. Its damage ignores armor, tests the resolve of the enemy and can chain to multiple opponents. \n\n Vattghern signs have a base cooldown of 2 turns (shared among all of them). Sign intensity affects this sign\'s damage, morale damage, and chain-hit amount.";
		this.m.KilledString = "Electrocuted";
		this.m.Icon = "skills/pov_active_bront.png";
		this.m.IconDisabled = "skills/pov_active_bront_sw.png";
		this.m.Overlay = "pov_active_bront";
		this.m.SoundOnUse = [
			"sounds/combat/dlc2/legendary_lightning_01.wav",
			"sounds/combat/dlc2/legendary_lightning_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsUsingHitchance = false;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsShowingProjectile = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsTargetingActor = false;
		this.m.IsAOE = true;
		//this.m.IsWeaponSkill = true;
		//this.m.InjuriesOnBody = this.Const.Injury.BurningBody;
		//this.m.InjuriesOnHead = this.Const.Injury.BurningHead;
		this.m.DirectDamageMult = 1.00;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
		//this.m.ChanceDecapitate = 75;
		//this.m.ChanceDisembowel = 50;
		//this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();

		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local chance = -10 + intensity; // burn chance = 30 + sign intensity

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/pov_intensity.png",
			text = "Current Sign Intensity: [color=" + this.Const.UI.Color.PositiveValue + "]"+ this.Math.round(intensity) +"%[/color]."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/pov_fire.png",
			text = "Hit enemies roll a morale check, with a penalty of [color=" + this.Const.UI.Color.PositiveValue + "]"+this.m.MoraleCheckDifficulty+"[/color] (-15, +1 for each intensity point. values below 0 are a bonus instead)."
		});
		if (this.getMaxRange() > 0)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + ::Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles"
			});
		}
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Can chain-hit up to " + (this.m.LightningBounceNum + 1) + " targets. (2 + 1 for every 15 Intensity)."
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		// + 1 bounce for every 15 intensity
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local bounceAddition = 1 + this.Math.floor(intensity/15); // bounce num = 2 + 1 per 15 intensity
		local moraleCheck = -15 + intensity

		if (bounceAddition > 0)
		{
			this.m.LightningBounceNum = bounceAddition;
		}

		this.m.MoraleCheckDifficulty = moraleCheck;
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInSigns ? 0.75 : 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInSigns ? 3 : 4;
	}
	
	function isUsable()
	{
		local actor = this.getContainer().getActor();
		return (!actor.getSkills().hasSkill("effects.pov_sign_cooldown") && this.skill.isUsable())
	}

	function onUse( _user, _targetTile )
	{
		local myTile = _user.getTile(), currentTargetTile = _targetTile, selectedTargets = [];
		local target = currentTargetTile.getEntity();
		if (target != null)
		{
			selectedTargets.push(target.getID());
		}
		
		this.applyEffect({
			Skill = this,
			User = _user,
			TargetTile = currentTargetTile,
			Target = target
		}, 100);
		
		local potentialTiles, potentialTargets;

		for (local i = 1; i <= this.m.LightningBounceNum; ++i)
		{
			potentialTiles = this.searchTiles(currentTargetTile, myTile);
			potentialTargets = this.searchTargets(_user , potentialTiles, selectedTargets);

			if (potentialTargets.len() != 0)
			{
				target = ::MSU.Array.rand(potentialTargets).getEntity();
				selectedTargets.push(target.getID());
				currentTargetTile = target.getTile();
			}
			else
			{
				target = null;
				currentTargetTile = ::MSU.Array.rand(potentialTiles);
			}

			this.applyEffect({
				Skill = this,
				User = _user,
				TargetTile = currentTargetTile,
				Target = target
			}, i * 200 + 150);
		}

		return true;
	}

	function searchTiles( _tile, _originTile )
	{
		local ret = [];

		for( local i = 0; i < 6; ++i )
		{
			if (!_tile.hasNextTile(i))
				continue;

			local tile = _tile.getNextTile(i);

			if (!_originTile.isSameTileAs(tile))
				ret.push(tile);
		}

		return ret;
	}

	function searchTargets( _user , _tiles , _excluded )
	{
		local ret = [];

		foreach( tile in _tiles )
		{
			if (!tile.IsOccupiedByActor ||
				!tile.getEntity().isAttackable() ||
				_excluded.find(tile.getEntity().getID()) != null)
				continue;

			if (tile.getEntity().isAlliedWith(_user))
				continue;
			
			ret.push(tile);
		}

		return ret;
	}

	function applyEffect( _data, _delay )
	{
		::Time.scheduleEvent(this.TimeUnit.Virtual, _delay, function( _tag )
		{			
				for( local i = 0; i < ::Const.Tactical.LightningParticles.len(); ++i )
				{
					::Tactical.spawnParticleEffect(true, ::Const.Tactical.LightningParticles[i].Brushes, _tag.TargetTile, ::Const.Tactical.LightningParticles[i].Delay, ::Const.Tactical.LightningParticles[i].Quantity, ::Const.Tactical.LightningParticles[i].LifeTimeQuantity, ::Const.Tactical.LightningParticles[i].SpawnRate, ::Const.Tactical.LightningParticles[i].Stages);
				}
			
		}, _data);

		if (_data.Target == null)
			return;

		::Time.scheduleEvent(this.TimeUnit.Virtual, _delay + 200, function( _tag )
		{
			if (::MSU.isNull(_tag.User) || !_tag.User.isAlive())
				return;

			_tag.Skill.attackEntity(_tag.User, _tag.Target);
		}.bindenv(this), _data);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();
		local intensity = 1 + actor.getCurrentProperties().SignIntensity;

		if (_skill == this)
		{
			this.removeMainhandBonuses(_properties);
			// Skill Stats
			_properties.DamageRegularMin += 15 * intensity;
			_properties.DamageRegularMax += 25 * intensity;
			_properties.DamageArmorMult *= 0.00;
		}
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
		if (_skill != this || ::MSU.isNull(_targetEntity) || !_targetEntity.isAlive())
			return;

		if (_targetEntity.getMoraleState() == ::Const.MoraleState.Ignore || !_targetEntity.getCurrentProperties().IsAffectedByLosingHitpoints)
			return;

		this.spawnIcon("perk_27", _targetEntity.getTile());

		if (_damageInflictedHitpoints >= ::Const.Morale.OnHitMinDamage)
			return; 

		_targetEntity.checkMorale(-1, this.m.MoraleCheckDifficulty);
	}

});

