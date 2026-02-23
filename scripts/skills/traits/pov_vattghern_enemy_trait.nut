/////////////////////////////////////////////////////////////////////
// 					Author: The Blue Templar 					   //
// 			Not to be used elsewhere or tampered with, 2025.       //
/////////////////////////////////////////////////////////////////////

this.pov_vattghern_enemy_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_witcher_enemy";
		this.m.Name = "Vatt'ghern";
		this.m.Icon = "ui/traits/pov_vattghern.png";
		this.m.Description = "A terrifying Vatt\'ghern. Also adds 10 regen and 50 Sign Intensity";
		this.m.Order = this.Const.SkillOrder.Background - 3;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/kills.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] regen and [color=" + this.Const.UI.Color.PositiveValue + "]50[/color] sign intensity"
		});

		return result;

	}

	function onUpdate (_properties)
	{
		_properties.SignIntensity += 0.45;

		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
		}else
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.StatusEffect;
			this.m.Order = this.Const.SkillOrder.Background - 3;
		}
	}

	// Vattghern Eyes  Effect
	function onAdded()
	{
		local actor = this.getContainer().getActor();

		// If actor is a Vattghern, add a new, special bust layer!
		if (actor.hasSprite("pov_bust"))
		{
			local bust_sprite = actor.getSprite("pov_bust");
			bust_sprite.setBrush("pov_vattghern_bust"); 
			//mutant_bust_sprite.Saturation = 0.8;
			bust_sprite.Visible = true;
		}

		// Done it like this, so it can be removed by special water
		if (actor.hasSprite("permanent_injury_4"))
		{
			local sprite = actor.getSprite("permanent_injury_4");
			sprite.Visible = true;
			sprite.setBrush("pov_vattghern_eyes");
			sprite.Alpha = 0;
			sprite.fadeIn(1500);
		}

		actor.setDirty(true);
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
		local healthAdded = this.Math.min(healthMissing, actor.getHitpointsMax()* 0.10);

		if (healthAdded <= 0)
		{
			return;
		}

		actor.setHitpoints(actor.getHitpoints() + healthAdded);
		actor.setDirty(true);

		if (!actor.isHiddenToPlayer())
		{
			this.Tactical.spawnIconEffect("status_effect_79", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.RacialEffect * 1.30, actor.getPos());
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + healthAdded + " points");
		}
	}


});

