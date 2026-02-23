this.pov_axii_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 0 // for enemy
	},
	function create()
	{
		this.m.ID = "actives.pov_axii";
		this.m.Name = "Axii Sign";
		this.m.Description = "Inflicts the [color=" + this.Const.UI.Color.NegativeValue + "]Paralyzed[/color] effect on the enemy, reducing their AP by 1, and their initiative and Offensive skills by 20% for two turns.";
		this.m.KilledString = "Bok bok BAAAWK lmao";
		this.m.Icon = "skills/pov_active_axii.png";
		this.m.IconDisabled = "skills/pov_active_axii_sw.png";
		this.m.Overlay = "pov_active_axii";
		this.m.SoundOnUse = [
			"sounds/enemies/horror_spell_01.wav",
			"sounds/enemies/horror_spell_02.wav",
			"sounds/enemies/horror_spell_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/humans/0/human_fatigue_01.wav",
			"sounds/humans/0/human_fatigue_01.wav",
			"sounds/humans/0/human_fatigue_01.wav",
			"sounds/humans/0/human_fatigue_01.wav"
		];
		//this.m.SoundVolume = 1.25;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsRanged = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MaxLevelDifference = 6;
		this.m.IsUsingHitchance = false;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local baffleChance = 	65 + intensity * 1.0;	// e.g. 65% base + 1% per intensity
		local dazeChance = 		50 + intensity * 1.0;	// e.g. 50% base + 1% per intensity
		local stunChance = 		40 + intensity * 1.0;	// e.g. 40% base + 1% per intensity

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/pov_intensity.png",
			text = "Current Sign Intensity: [color=" + this.Const.UI.Color.PositiveValue + "]"+ this.Math.round(intensity) +"%[/color]."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Target entity has [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(baffleChance) + "%[/color] chance of being baffled, [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(dazeChance) + "%[/color] chance of being dazed, and [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(stunChance) + "%[/color] chance of being stunned."
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "All chances increase relative to the current Sign Intensity stat (For each 1% intensity, + 1% chance)."
		});
		return ret;
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInSigns ? 0.75 : 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInSigns ? 3 : 4;
	}
	
	function onCombatStarted()
	{
		this.m.Cooldown = 0;
	}

	function onCombatFinished()
	{
		this.m.Cooldown = 0;
	}

	function onTurnStart()
	{
		this.m.Cooldown = this.Math.max(0, this.m.Cooldown - 1);
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("trait.pov_witcher"))
		{
			return (!actor.getSkills().hasSkill("effects.pov_sign_cooldown") && this.skill.isUsable());
		}
		else if (this.m.Cooldown <= 0 && this.skill.isUsable())
		{
			return true;
		}
		else
		{
			return false;
		}	
	}
	
	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInSigns ? 0.75 : 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInSigns ? 3 : 4;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Cooldown = 3;
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local baffleChance = 	65 + intensity * 1.0;	// e.g. 65% base + 1% per intensity
		local dazeChance = 		50 + intensity * 1.0;	// e.g. 50% base + 1% per intensity
		local stunChance = 		40 + intensity * 1.0;	// e.g. 40% base + 1% per intensity

		//baffleChance = 100; //test
		//dazeChance = 100; //test
		//stunChance = 100; //test

		local target = _targetTile.getEntity();
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);

		if (target.isAlive())
		{
			if (this.Math.rand(0, 100) < baffleChance)
			{
				if (!target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " got baffled!");
				}

				local effect = this.new("scripts/skills/effects/legend_baffled_effect");
				target.getSkills().add(effect);
			}

			if (this.Math.rand(0, 100) < dazeChance)
			{
				if (!target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " got dazed!");
				}

				local effect = this.new("scripts/skills/effects/dazed_effect");
				target.getSkills().add(effect);
			}

			if (this.Math.rand(0, 100) < dazeChance)
			{
				if (!target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " got stunned!");
				}

				local effect = this.new("scripts/skills/effects/stunned_effect");
				target.getSkills().add(effect);
			}
		}
	}

	function onVerifyTarget( _originTile, _targetTile ) //This stops you from targeting allies with this skill
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (_targetTile.getEntity().isAlliedWith(this.getContainer().getActor()))
		{
			return false;
		}

		return true;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill == this)
		{
			// Sign Cooldown (player only, for enemy its set individually to 3)
			local actor = this.getContainer().getActor();
			if (actor.getSkills().hasSkill("trait.pov_witcher"))
			{
		    	actor.getSkills().add(this.new("scripts/skills/effects/pov_sign_cooldown_effect"));
			}
		}	
	}
});
