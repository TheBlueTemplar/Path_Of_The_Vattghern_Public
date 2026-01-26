this.pov_quen_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Strength = 0,
		Blocked = false,
		BlockedDamage = 0,
		Reflected = false
	},
	function create()
	{
		this.m.ID = "effects.pov_quen";
		this.m.Name = "Quen Shield";
		this.m.Description = "This character gets protected by a surrounding magical [color=" + this.Const.UI.Color.NegativeValue + "]shield[/color]. Upon contact with an enemy attack, it breaks, protecting the user and harming the attacking enemy in retaliation. \n\n Damage resistance and retaliation both depend on the user\'s sign intensity.";
		this.m.Icon = "skills/pov_quen_effect.png";
		this.m.IconMini = "pov_mini_quen_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character gets protected by a surrounding magical [color=" + this.Const.UI.Color.NegativeValue + "]shield[/color]. Upon contact with an enemy attack, it breaks, protecting the user and harming the attacking enemy in retaliation. \n\n Damage resistance and retaliation both depend on the user\'s sign intensity.";
	}

	function onAdded() 
	{
		this.spawnIcon("pov_medium_quen_effect", this.getContainer().getActor().getTile());
		::logInfo("Quen Shield Added. Strength: " + this.m.Strength);

		local actor = this.getContainer().getActor();
		if (actor.hasSprite("pov_front_socket"))
		{
			local quen_bubble = actor.getSprite("pov_front_socket");
			quen_bubble.setBrush("pov_bubble");
			quen_bubble.Color = this.createColor("#edc905"); // Gold
			quen_bubble.Saturation = 0.8;
			quen_bubble.Scale = 1.25;
			//quen_bubble.varySaturation(0.1);
			quen_bubble.varyColor(0.05, 0.05, 0.05);
			quen_bubble.Visible = true;

			actor.setRenderCallbackEnabled(true);
			actor.setAlwaysApplySpriteOffset(true);
			//this.m.isActive = true;
		}
	}

	function onRemoved()
	{	
		/*local actor = this.getContainer().getActor();
		if (actor.hasSprite("pov_front_socket"))
		{
			local quen_bubble = actor.getSprite("pov_front_socket");
			quen_bubble.Visible = false;
		}*/	
		this.Sound.play("sounds/combat/pov_quen_sign_break.wav", this.Const.Sound.Volume.Tactical);

		local actor = this.getContainer().getActor();
		if (actor == null) return;

		if (!actor.hasSprite("pov_front_socket"))
			return;

		local bubble = actor.getSprite("pov_front_socket");
		bubble.Visible = true;

		// Start values
		bubble.Scale = 1.25;
		bubble.Alpha = 255;

		local tag = { Actor = actor, Tick = 0 };

		// Local scheduled function (no this.quenPopStep needed)
		local fn = null;
		fn = function( _tag )
		{
			local a = _tag.Actor;
			if (a == null || !a.isAlive() || a.isDying())
				return;

			if (!a.hasSprite("pov_front_socket"))
				return;

			local s = a.getSprite("pov_front_socket");

			local steps  = 10;
			local stepMs = 40;

			local t = _tag.Tick.tofloat() / (steps - 1);
			if (t > 1.0) t = 1.0;

			local k = 1.0 - (1.0 - t) * (1.0 - t);

			// Grow + fade
			s.Scale = 1.25 + 1.15 * k;
			s.Alpha = this.Math.max(0, 255 * (1.0 - k));

			if (_tag.Tick >= steps - 1)
			{
				s.Visible = false;
				s.Scale = 1.0;  // optional reset
				s.Alpha = 255;  // optional reset
				return;
			}

			_tag.Tick = _tag.Tick + 1;
			this.Time.scheduleEvent(this.TimeUnit.Virtual, stepMs, fn, _tag);
		}.bindenv(this);

		// Kick off
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 0, fn, tag);
	}

	function onUpdate( _properties )
	{
		if (this.m.Blocked == true && this.m.Reflected == true)
		{
			this.removeSelf();
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local strength = this.m.Strength.tofloat();
		local damageReduction = this.Math.maxf(0.0 , 1 - (strength / 100.0));
		//::logInfo("Quen Sign Initial Damage Reduction (mult): " + damageReduction);

		if (_hitInfo.DamageRegular > 1 && this.m.Blocked == false)
		{
			//this.m.BlockedDamage = _hitInfo.DamageRegular * damageReduction;
			this.m.BlockedDamage = ((_hitInfo.DamageArmor + _hitInfo.DamageRegular)/2) * (1 - damageReduction);
			::logInfo("Quen Sign Blocked Damage: " + this.m.BlockedDamage);
			_properties.DamageReceivedTotalMult = damageReduction;
			::logInfo("Quen Sign Damage Reduction Applied (mult): " + damageReduction);
			this.m.Blocked = true;
		}
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_damageHitpoints > 0 || _damageArmor > 0)
		{
			if (_attacker != null && _attacker.isAlive() && _attacker.getHitpoints() > 0 && _attacker.getID() != this.getContainer().getActor().getID() && !_attacker.getCurrentProperties().IsImmuneToDamageReflection)
			{
				if (this.m.Reflected == false && this.m.Blocked == true)
				{
					local strength = this.m.Strength.tofloat();
					local actor = this.getContainer().getActor();
					local intensity = this.Math.maxf(1.0 , 0.25 * strength); // takes 25% of intensity
					local scale = 1 + (intensity / 100); // its used to increase reflect damage by 25% of that value
					::logInfo("Intensity Damage Bonus (Mult): " + scale);

					local damageReflection = this.m.BlockedDamage * scale;

					::logInfo("Quen Sign Damage Reflected: " + damageReflection);

					// damage cap
					if (damageReflection > 250)
					{
						damageReflection = 250;
					}
					
					local hitInfo = clone this.Const.Tactical.HitInfo;
					hitInfo.DamageRegular = damageReflection; //100% Vs Armor, 25% A.Ignore
					hitInfo.DamageArmor = damageReflection;
					hitInfo.DamageDirect = 0.10;
					hitInfo.BodyPart = this.Const.BodyPart.Body;
					hitInfo.BodyDamageMult = 1.0;
					hitInfo.FatalityChanceMult = 0.0;
					_attacker.onDamageReceived(_attacker, null, hitInfo);

					this.m.Reflected = true;
				}
			}
		}
	}


});
