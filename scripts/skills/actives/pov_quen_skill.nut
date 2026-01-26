this.pov_quen_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ShieldPower = 50
	},
	function create()
	{
		this.m.ID = "actives.pov_quen";
		this.m.Name = "Quen Sign";
		this.m.Description = "The vatt\'ghern creates a magical shield that has the potential of blocking substantial damage, while also harming the attacking enemy. \n\n Vattghern signs have a base cooldown of 2 turns (shared among all of them). Sign intensity affects this sign\'s damage resistance and retaliation damage.";
		//this.m.KilledString = "Electrocuted";
		this.m.Icon = "skills/pov_active_quen.png";
		this.m.IconDisabled = "skills/pov_active_quen_sw.png";
		this.m.Overlay = "pov_active_quen";
		this.m.SoundOnUse = [
			"sounds/combat/pov_quen_sign.wav"
		];	
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = false;
		//this.m.IsAOE = true;
		//this.m.InjuriesOnBody = this.Const.Injury.BurningBody;
		//this.m.InjuriesOnHead = this.Const.Injury.BurningHead;
		//this.m.DirectDamageMult = 1.00;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
		//this.m.ChanceDecapitate = 75;
		//this.m.ChanceDisembowel = 50;
		//this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

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
			icon = "ui/icons/melee_defense.png",
			text = "Grants a magical shield, that blocks [color=" + this.Const.UI.Color.PositiveValue + "]"+this.m.ShieldPower+"%[/color] damage from the next attack received, and damages the enemy for the blocked amount. The shield then breaks."
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "Blocked Damage increases by [color=" + this.Const.UI.Color.PositiveValue + "]1%[/color] for each point of sign intensity, and retaliation damage is increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color] of total Sign intensity."
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		// Quen Power equal to 50 + 1 * sign intensity (cap at 100)
		// (Shown in effect) Reflect damage increased by 25% of Sign Intensity
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;	
		this.m.ShieldPower = this.Math.min(100, 50 + intensity);
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
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;

		local skill = this.new("scripts/skills/effects/pov_quen_effect")
		skill.m.Strength = this.m.ShieldPower;
		actor.getSkills().add(skill);
		return true;
	}

	/*function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();
		local intensity = 1 + actor.getCurrentProperties().SignIntensity;

		if (_skill == this)
		{
			this.removeMainhandBonuses(_properties);
			// Skill Stats
			_properties.DamageRegularMin += 20 * intensity;
			_properties.DamageRegularMax += 30 * intensity;
			_properties.DamageArmorMult *= 0.00;
		}
	}*/

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill == this)
		{
			// Sign Cooldown
			local actor = this.getContainer().getActor();
	    	actor.getSkills().add(this.new("scripts/skills/effects/pov_sign_cooldown_effect"));
		}	
	}

});

