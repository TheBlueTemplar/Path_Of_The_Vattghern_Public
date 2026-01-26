this.pov_fire_handgonne_skill <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 0,
		AdditionalHitChance = 0,
		SoundOnFire = []
	},
	function onItemSet()
	{
		this.m.MaxRange = this.m.Item.getRangeMax();
	}

	function create()
	{
		this.m.ID = "actives.pov_fire_handgonne";
		this.m.Name = "Ignite Feuerspeier";
		this.m.Description = "Ignite the fuse of your Feuerspeier. Does major fire damage. Can hit 2 targets at once, but targets farther away are less likely to be hit. Can also be used while engaged in melee.";
		this.m.Icon = "skills/active_203.png";
		this.m.IconDisabled = "skills/active_203_sw.png";
		this.m.Overlay = "active_203";
		this.m.SoundOnFire = [
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
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 750;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsWeaponSkill = true;
		this.m.IsUsingHitchance = true;
		this.m.IsDoingForwardMove = false;
		this.m.IsTargetingActor = false;
		this.m.IsAOE = true;
		this.m.InjuriesOnBody = this.Const.Injury.BurningBody;
		this.m.InjuriesOnHead = this.Const.Injury.BurningHead;
		this.m.DirectDamageMult = 0.25;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 5;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.MaxRangeBonus = 1;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can hit up to 2 targets"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles on flat ground and [color=" + this.Const.UI.Color.PositiveValue + "]" + (this.getMaxRange() + this.m.MaxRangeBonus) + "[/color] tiles if shooting downhill"
		});

		if (this.m.AdditionalAccuracy >= 0)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+" + (this.m.AdditionalAccuracy) + "%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]" + (-10 + this.m.AdditionalHitChance) + "%[/color] per tile of distance. This chance is unaffected by objects or characters in the line of fire."
			});
		}
		else
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]" + (this.m.AdditionalAccuracy) + "%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]" + (-10 + this.m.AdditionalHitChance) + "%[/color] per tile of distance. This chance is unaffected by objects or characters in the line of fire."
			});
		}

		local ammo = this.getAmmo();

		if (ammo > 0)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/ammo.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]" + ammo + "[/color] shots left"
			});
		}
		else
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Needs a non-empty powder bag equipped[/color]"
			});
		}

		if (!this.getItem().isLoaded())
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Must be reloaded before firing again[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && this.getItem().isLoaded();
	}

	function getAmmo()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Ammo);

		if (item == null)
		{
			return 0;
		}

		if (item.getAmmoType() == this.Const.Items.AmmoType.Powder)
		{
			return item.getAmmo();
		}
	}

	function applyEffectToTargets( _tag )
	{
		local user = _tag.User;
		local targets = _tag.Targets;

		foreach( t in targets )
		{
			if (!t.isAlive() || t.isDying())
			{
				continue;
			}

			local success = this.attackEntity(user, t, false);

			if (success && t.isAlive() && !t.isDying() && t.getTile().IsVisibleForPlayer)
			{
				for( local i = 0; i < this.Const.Tactical.BurnParticles.len() - 1; i = ++i )
				{
					local effect = this.Const.Tactical.BurnParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, t.getTile(), effect.Delay, effect.Quantity * 0.1, effect.LifeTimeQuantity * 0.1, effect.SpawnRate * 0.1, effect.Stages, this.createVec(0, 0));
				}
			}
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += this.m.AdditionalAccuracy;
			_properties.HitChanceAdditionalWithEachTile += -10 + this.m.AdditionalHitChance;
		}
	}

	function onTargetSelected( _targetTile )
	{
		this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, _targetTile, _targetTile.Pos.X, _targetTile.Pos.Y);
		local ownTile = this.m.Container.getActor().getTile();
		local dir = ownTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local forwardTile = _targetTile.getNextTile(dir);

			if (this.Math.abs(forwardTile.Level - ownTile.Level) <= 1)
			{
				this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, forwardTile, forwardTile.Pos.X, forwardTile.Pos.Y);
			}
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.AdditionalAccuracy = this.m.Item.getAdditionalAccuracy();
		this.m.FatigueCostMult = _properties.IsSpecializedInCrossbows ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		this.Sound.play(this.m.SoundOnFire[this.Math.rand(0, this.m.SoundOnFire.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, _user.getPos());
		local tag = {
			Skill = this,
			User = _user,
			TargetTile = _targetTile
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onDelayedEffect.bindenv(this), tag);
		this.getItem().setLoaded(false);
		local skillToAdd = this.new("scripts/skills/actives/reload_handgonne_skill");
		skillToAdd.setItem(this.getItem());
		skillToAdd.setFatigueCost(this.Math.max(0, skillToAdd.getFatigueCostRaw() + this.getItem().m.FatigueOnSkillUse));
		this.getContainer().add(skillToAdd);
		return true;
	}

	function onDelayedEffect( _tag )
	{

		local user = _tag.User;
		local targetTile = _tag.TargetTile;
		local myTile = user.getTile();
		local dir = myTile.getDirectionTo(targetTile);
		//this.consumeAmmo();

		if (myTile.IsVisibleForPlayer)
		{
			if (user.isAlliedWithPlayer())
			{
				for( local i = 0; i < this.Const.Tactical.FireLanceRightParticles.len(); i = ++i )
				{
					local effect = this.Const.Tactical.FireLanceRightParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, myTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
				}
			}
			else
			{
				for( local i = 0; i < this.Const.Tactical.FireLanceLeftParticles.len(); i = ++i )
				{
					local effect = this.Const.Tactical.FireLanceLeftParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, myTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
				}
			}
		}

		local targets = [];

		if (targetTile.IsOccupiedByActor && targetTile.getEntity().isAttackable())
		{
			targets.push(targetTile.getEntity());
		}

		if (targetTile.hasNextTile(dir))
		{
			local nextTile = targetTile.getNextTile(dir);

			if (nextTile.IsOccupiedByActor && nextTile.getEntity().isAttackable() && this.Math.abs(nextTile.Level - myTile.Level) <= 1)
			{
				targets.push(nextTile.getEntity());
			}
		}

		this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], 1.0, user.getPos());
		local tag = {
			User = user,
			Targets = targets
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, this.applyEffectToTargets.bindenv(this), tag);
		return true;
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.reload_handgonne");
	}

});

