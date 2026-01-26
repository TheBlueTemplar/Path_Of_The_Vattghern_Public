this.pov_sandgolem_weak_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {
		HeadArmorBoost = 60,
		HeadDamageTaken = 0,
		BodyArmorBoost = 60,
		BodyDamageTaken = 0
	},
	function create()
	{
		this.m.ID = "effects.pov_sandgolem_weak_mutagen";
		this.m.Name = "Ifrit\'s Durability";
		this.m.Icon = "skills/pov_ifrit_mutant.png";
		this.m.IconMini = "pov_mini_ifrit_mutant";
		this.m.Overlay = "ifrit";
		this.m.Type = this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Background + 1;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Stone Skin[/color]: This character\'s skin has mutated and now forms hard, rock-like patches that are much hardier and difficult to puncture. The now sandy pores of the skin allow the character to propel some sand into enemy eyes, to disorient them.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Uncomfortable [/color]: The changes on this character\'s skin make the skin itchy, heavier and harder to sweat, causing problems with the caracter\'s speed and stamina.";
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
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Get the [color=" + this.Const.UI.Color.PositiveValue + "]\"Throw Dirt\"[/color] skill (3 Range)."
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "This character\'s skin is hard and stone-like, granting [color=" + this.Const.UI.Color.PositiveValue + "]60[/color] points of natural armor"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "This character also gets [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] Total Damage Reduction."
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "Lose [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color] Initiative."
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "All skills now cost [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color] more Fatigue."
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Fatigue recovery is reduced by [color=" + this.Const.UI.Color.NegativeValue + "]2[/color] Points."
			}

		];
		return ret;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_throw_dirt"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_throw_dirt_skill"));
		}
	}


	function onCombatStarted()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
	}

	function onCombatFinished()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
	}

	function onUpdate( _properties )
	{	
		// Buffs
		_properties.Armor[this.Const.BodyPart.Head] += this.Math.max(0.0, this.m.HeadArmorBoost - this.m.HeadDamageTaken);
		_properties.Armor[this.Const.BodyPart.Body] += this.Math.max(0.0, this.m.BodyArmorBoost - this.m.BodyDamageTaken);
		_properties.ArmorMax[this.Const.BodyPart.Head] += this.m.HeadArmorBoost;
		_properties.ArmorMax[this.Const.BodyPart.Body] += this.m.BodyArmorBoost;
		// Debuffs
		_properties.Initiative *= 0.85;
		_properties.FatigueEffectMult *= 1.10;
		_properties.FatigueRecoveryRate += -2;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{	
		_properties.DamageReceivedTotalMult *= 0.90;

		if (_hitInfo.BodyPart == this.Const.BodyPart.Head)
		{
			if (this.m.HeadDamageTaken >= this.m.HeadArmorBoost)
			{
				return;
			}

			// weird fix to weird issue
			local cap = this.m.HeadArmorBoost - this.m.HeadDamageTaken;
			if (cap > this.m.HeadArmorBoost/2)
			{
				cap = this.m.HeadArmorBoost/2;
			}
			_properties.DamageArmorReduction += cap;
			this.m.HeadDamageTaken += _hitInfo.DamageArmor;
		}
		else if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			if (this.m.BodyDamageTaken >= this.m.BodyArmorBoost)
			{
				return;
			}

			// weird fix to weird issue
			local cap = this.m.BodyArmorBoost - this.m.BodyDamageTaken;
			if (cap > this.m.BodyArmorBoost/2)
			{
				cap = this.m.BodyArmorBoost/2;
			}
			_properties.DamageArmorReduction += cap;
			this.m.BodyDamageTaken += _hitInfo.DamageArmor;
		}
	}

	function isHidden()
	{
		return this.inBattleHiddenCheck();
	}

	function inBattleHiddenCheck()
	{
		if (!("State" in this.Tactical) || this.Tactical.State == null)
		{
			return false;
		}

		return true;
	}

});

