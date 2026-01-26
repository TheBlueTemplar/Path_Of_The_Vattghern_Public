::Const.Tactical.Common.onApplyPovYrden <- function(_tile, _entity)
{
	local sounds = [];
	sounds = [
		"sounds/enemies/miasma_appears_01.wav",
		"sounds/enemies/miasma_appears_02.wav",
		"sounds/enemies/miasma_appears_03.wav"
	];	

	local faction = _entity.getFaction();

	if (faction == this.Const.Faction.Player)
	{
		// Some kind of "good" effect? or nothing lel
	}
	else 
	{
		if (!_entity.getSkills().hasSkill("effect.pov_yrden"))
		{
			_entity.getSkills().add(this.new("scripts/skills/effects/pov_yrden_effect"));
		}
		//return;
	}
	
	::Sound.play(sounds[::Math.rand(0, sounds.len() - 1)], ::Const.Sound.Volume.Actor, _entity.getPos());
		
};

::Const.Tactical.Common.onApplyPovMiasma <- function(_tile, _entity)
{
	if (!_entity.getFlags().has("undead") && !_entity.getCurrentProperties().IsImmuneToPoison)
	{
		local damageMult = _entity.getCurrentProperties().IsResistantToMiasma ? 0.5 : 1.0;
		::Tactical.spawnIconEffect("status_effect_00", _tile, ::Const.Tactical.Settings.SkillIconOffsetX, ::Const.Tactical.Settings.SkillIconOffsetY, ::Const.Tactical.Settings.SkillIconScale, ::Const.Tactical.Settings.SkillIconFadeInDuration, ::Const.Tactical.Settings.SkillIconStayDuration, ::Const.Tactical.Settings.SkillIconFadeOutDuration, ::Const.Tactical.Settings.SkillIconMovement);
		local sounds = [];
		if (_entity.getFlags().has("human"))
			sounds = [
				"sounds/humans/human_coughing_01.wav",
				"sounds/humans/human_coughing_02.wav",
				"sounds/humans/human_coughing_03.wav",
				"sounds/humans/human_coughing_04.wav"
			];
		else
			sounds = [
				"sounds/enemies/miasma_appears_01.wav",
				"sounds/enemies/miasma_appears_02.wav",
				"sounds/enemies/miasma_appears_03.wav"
			];	

		_entity.getSkills().add(this.new("scripts/skills/effects/pov_miasma_effect"));

		::Sound.play(sounds[::Math.rand(0, sounds.len() - 1)], ::Const.Sound.Volume.Actor, _entity.getPos());
		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = this.Math.rand(4, 8) * damageMult;
		hitInfo.DamageDirect = 1.0;
		hitInfo.BodyPart = ::Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.FatalityChanceMult = 0.0;		
		_entity.onDamageReceived(_entity, null, hitInfo);
	}			
};

// Edit Holy Flame skill - for compatibility
::Const.Tactical.Common.onApplyHolyFlame = function(_tile, _entity, _killer = null)
{
	local sounds = [
		"sounds/combat/pov_holy_fire_01.wav",
		"sounds/combat/pov_holy_fire_02.wav",
		"sounds/combat/pov_holy_fire_03.wav",
		"sounds/combat/pov_holy_fire_04.wav",
		"sounds/combat/pov_holy_fire_05.wav",
		"sounds/combat/pov_holy_fire_06.wav"
	];

	this.Sound.play(sounds[this.Math.rand(0, sounds.len() - 1)], this.Const.Sound.Volume.Actor, _entity.getPos());

	if (_entity.isNonCombatant() )
	{
		return;
	}

	local faction = _entity.getFaction();

	if (_entity.getFlags().has("undead") || _entity.getFlags().has("cultist"))
	{
		if (!_entity.getSkills().hasEffect(::Legends.Effect.LegendConsecratedEffect))
		{
			::Legends.Effects.grant(_entity, ::Legends.Effect.LegendConsecratedEffect, function(_effect) {
				if (_killer != null && _killer.getFaction() == this.Const.Faction.Player)
					_effect.setActor(_killer);
			}.bindenv(this));
		}
		return;
	}
	else if (faction == this.Const.Faction.Player || faction == this.Const.Faction.Civilian || faction == this.Const.Faction.NobleHouse)
	{
		if (!_entity.getSkills().hasEffect(::Legends.Effect.LegendSanctifiedEffect))
		{
			::Legends.Effects.grant(_entity, ::Legends.Effect.LegendSanctifiedEffect);
		}
	}
};
