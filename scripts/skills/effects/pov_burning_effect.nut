this.pov_burning_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 1,
		Damage = 10,
		LastRoundApplied = 0
	},
	function getDamage()
	{
		return this.m.Damage;
	}

	function setDamage( _d )
	{
		this.m.Damage = _d;
	}

	function create()
	{
		this.m.ID = "effects.pov_burning";
		this.m.Name = "Burning!!";
		this.m.KilledString = "Burned Alive";
		this.m.Icon = "skills/pov_burning_effect.png";
		this.m.IconMini = "pov_mini_burning_effect";
		this.m.SoundOnUse = [
			"sounds/combat/dlc6/fire_hit_01.wav",
			"sounds/combat/dlc6/fire_hit_02.wav",
			"sounds/combat/dlc6/fire_hit_03.wav",
			"sounds/combat/dlc6/fire_hit_04.wav",
			"sounds/combat/dlc6/fire_hit_05.wav",
			"sounds/combat/dlc6/fire_hit_06.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DamageOverTime;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is burning!! They lose [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Damage + "[/color] hitpoints each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s). \n\n While burning, they also losing [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color] damage, and [color=" + this.Const.UI.Color.NegativeValue + "]20%[/color] melee and ranged skill. \n\n On the other hand, they gain [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color] due to the panic of setting the fire out.";
	}

	function resetTime()
	{
		this.m.TurnsLeft = this.Math.max(1, 1 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

	function applyDamage()
	{
		if (this.m.LastRoundApplied != this.Time.getRound())
		{
			this.m.LastRoundApplied = this.Time.getRound();
			this.spawnIcon("pov_medium_burning_effect", this.getContainer().getActor().getTile());

			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
			}

			// Hits both body and head for half damage each

			local hitInfo = clone this.Const.Tactical.HitInfo;
			hitInfo.DamageRegular = this.m.Damage / 2;
			hitInfo.DamageArmor = this.m.Damage / 2;
			hitInfo.DamageDirect = 0;
			hitInfo.BodyPart = this.Const.BodyPart.Body;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 0.0;
			hitInfo.Injuries = this.Const.Injury.Burning;
			hitInfo.IsPlayingArmorSound = false;
			this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);

			local hitInfo2 = clone this.Const.Tactical.HitInfo;
			hitInfo2.DamageRegular = this.m.Damage / 2;
			hitInfo2.DamageArmor = this.m.Damage / 2;
			hitInfo2.DamageDirect = 0;
			hitInfo2.BodyPart = this.Const.BodyPart.Head;
			hitInfo2.BodyDamageMult = 1.0;
			hitInfo2.FatalityChanceMult = 0.0;
			hitInfo2.Injuries = this.Const.Injury.Burning;
			hitInfo2.IsPlayingArmorSound = false;
			this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo2);
		}
	}

	function onAdded()
	{
		this.m.TurnsLeft = this.Math.max(1, 1 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
		this.spawnIcon("pov_medium_burning_effect", this.getContainer().getActor().getTile());
	}

	function onUpdate( _properties )
	{
		_properties.InitiativeMult *= 1.25;
		_properties.DamageTotalMult *= 0.90;
		_properties.MeleeSkillMult *= 0.80;
		_properties.RangedSkillMult *= 0.80;
		_properties.Vision -= 1;
	}


	function onTurnEnd()
	{
		this.applyDamage();

		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function onWaitTurn()
	{
		this.applyDamage();
	}

});

