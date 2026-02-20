this.pov_igni_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.pov_igni";
		this.m.Name = "Igni Sign";
		this.m.Description = "Spew fire from your palm in a sweeping motion, inflicting fire damage on enemies, with a chance of burning them on top, inflicting more damage and reducing their damage and attack, but increasing their initiative. \n\n Vattghern signs have a base cooldown of 2 turns (shared among all of them). Sign intensity affects this sign\'s damage and burn chance.";
		this.m.Icon = "skills/pov_active_igni.png";
		this.m.IconDisabled = "skills/pov_active_igni_sw.png";
		this.m.Overlay = "pov_active_igni";
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
		this.m.InjuriesOnBody = this.Const.Injury.BurningBody;
		this.m.InjuriesOnHead = this.Const.Injury.BurningHead;
		this.m.DirectDamageMult = 0.15;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		//this.m.ChanceDecapitate = 75;
		//this.m.ChanceDisembowel = 50;
		//this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();

		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local chance = 35 + intensity; // burn chance = 35 + sign intensity

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
			text = "Hits have [color=" + this.Const.UI.Color.PositiveValue + "]"+this.Math.round(chance)+"%[/color] chance of making the enemy [color=" + this.Const.UI.Color.PositiveValue + "]Burn[/color] for [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] of damage dealt, ontop of also debuffing them."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Is considered a melee attack. Can hit up to 3 targets"
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
			text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] chance to hit"
		});
		return ret;
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();
		return (!actor.getSkills().hasSkill("effects.pov_sign_cooldown") && this.skill.isUsable())
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

	    foreach (t in targets)
	    {
	        if (!t.isAlive() || t.isDying())
	            continue;

	        this.attackEntity(user, t, false);
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
	    local c = this.Const.Direction.COUNT;
	    local leftDir  = (dir - 1 + c) % c;
	    local rightDir = (dir + 1) % c;

	    // Decide left/right/top/bottom purely from direction
	    local particleSet = this.getSweepParticleSetByDir(dir);

	    // Spawn the sweep ONCE (from the caster tile)
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

	    // Build targets list for: selected tile + left neighbor + right neighbor
	    local targets = [];

	    // Selected tile
	    if (targetTile.IsOccupiedByActor)
	    {
	        local e = targetTile.getEntity();
	        if (e != null && e.isAttackable() && this.Math.abs(targetTile.Level - myTile.Level) <= 1)
	            targets.push(e);
	    }

	    // Left neighbor (from caster tile)
	    if (myTile.hasNextTile(leftDir))
	    {
	        local t = myTile.getNextTile(leftDir);
	        if (this.Math.abs(t.Level - myTile.Level) <= 1 && t.IsOccupiedByActor)
	        {
	            local e = t.getEntity();
	            if (e != null && e.isAttackable())
	                targets.push(e);
	        }
	    }

	    // Right neighbor (from caster tile)
	    if (myTile.hasNextTile(rightDir))
	    {
	        local t = myTile.getNextTile(rightDir);
	        if (this.Math.abs(t.Level - myTile.Level) <= 1 && t.IsOccupiedByActor)
	        {
	            local e = t.getEntity();
	            if (e != null && e.isAttackable())
	                targets.push(e);
	        }
	    }

	    // Optional: play hit sound at the moment the fire goes off
	    this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], 1.0, user.getPos());

	    // Schedule applying damage/effects (this is where attackEntity happens)
	    local tag2 = {
	        User = user,
	        Targets = targets
	    };

	    this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, this.applyEffectToTargets.bindenv(this), tag2);

	    return true;

	}

	function onTargetSelected( _targetTile )
	{
	    local ownTile = this.m.Container.getActor().getTile();
	    local dir = ownTile.getDirectionTo(_targetTile);

	    // Always highlight the main target tile
	    this.Tactical.getHighlighter().addOverlayIcon(
	        this.Const.Tactical.Settings.AreaOfEffectIcon,
	        _targetTile,
	        _targetTile.Pos.X,
	        _targetTile.Pos.Y
	    );

	    // Helper to wrap direction into [0..COUNT-1]
	    local function wrapDir( d )
	    {
	        local c = this.Const.Direction.COUNT;
	        d = d % c;
	        if (d < 0) d += c;
	        return d;
	    }

	    // Left and right relative to the attacker->target direction
	    local leftDir  = wrapDir(dir - 1);
	    local rightDir = wrapDir(dir + 1);

	    // Highlight neighbor in a given direction from ownTile (if valid + height ok)
	    local function tryHighlight( d )
	    {
	        if (!ownTile.hasNextTile(d)) return;

	        local t = ownTile.getNextTile(d);
	        if (this.Math.abs(t.Level - ownTile.Level) > 1) return;

	        this.Tactical.getHighlighter().addOverlayIcon(
	            this.Const.Tactical.Settings.AreaOfEffectIcon,
	            t,
	            t.Pos.X,
	            t.Pos.Y
	        );
	    }

	    tryHighlight(leftDir);
	    tryHighlight(rightDir);
	}

	function getSweepParticleSetByDir(_dir)
	{
		// Directions start counting clockwise, from on top entity
		// 0 - Top, 1 - FrontTop, 2 - FrontBottom, 3 - Bottom, 4 - BackBottom, 5 - BackFront
		switch (_dir)
		{
			case 0: return this.Const.Tactical.FireSweepTopParticles; break
			case 1: return this.Const.Tactical.FireSweepRightParticles; break
			case 2: return this.Const.Tactical.FireSweepRightParticles; break
			case 3: return this.Const.Tactical.FireSweepBottomParticles; break
			case 4: return this.Const.Tactical.FireSweepLeftParticles; break
			case 5: return this.Const.Tactical.FireSweepLeftParticles; break
		}
		// default / fallback
		return this.Const.Tactical.FireSweepRightParticles;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();
		local intensity = 1 + actor.getCurrentProperties().SignIntensity;

		if (_skill == this)
		{
			// Hit Chance Mod
			_properties.MeleeSkill -= 5;
			_properties.RangedSkill -= 5;
			// Skill Stats
			_properties.DamageRegularMin = 40 * intensity;
			_properties.DamageRegularMax = 55 * intensity;
			_properties.DamageArmorMult = 1.15;

			// Use whichever is higher
			if (_properties.MeleeSkill < _properties.RangedSkill)
			{
				_properties.MeleeSkill = _properties.RangedSkill;
			}
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
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local chance = 35 + intensity; // burn chance = 35 + sign intensity
		local damage = (_damageInflictedHitpoints + _damageInflictedArmor) * 0.20; // damage = 20% of inflicted dmg

		if (_skill == this)
		{
			if (!_targetEntity.isAlive() || _targetEntity.getHitpoints() <= 0)
			{
				return;
			}

			if (damage == null || damage < 0)
			{
				return;
			}

			if (this.Math.rand(0,100) < chance)
			{
				if (!_targetEntity.isHiddenToPlayer())
				{
					if (this.m.SoundOnHit.len() != 0)
					{
						this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());
					}

					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " is burning!");
				}

				local effect = this.new("scripts/skills/effects/pov_burning_effect");
				effect.setDamage(damage);
				_targetEntity.getSkills().add(effect);
			}
		}
		
	}

});

