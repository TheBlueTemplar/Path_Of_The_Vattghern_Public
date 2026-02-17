this.pov_scaling_special <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.pov_scaling";
		this.m.Name = "PoV Enemy Scaling";
		this.m.Description = "Optional effect added to all enemies. Purpose: Scaling!";
		this.m.Icon = "ui/perks/pov_champion_slayer.png"; // just some shit so its visible when testing
		this.m.IconMini = "status_effect_35_mini";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.Special;
		this.m.IsActive = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = true;
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
			}
		];
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]You should NOT be able to see this. If you do, report this[/color]"
		});
		return ret;
	}

	function onUpdate( _properties )
	{	
		if (!::TLW.EnemyScaling)
		{
			this.removeSelf();
		}

		if (this.Tactical.isActive())
		{
			getBonus(_properties);
		}	
	}

	getBonus = function(_properties)
	{
		// Scaled stat increase
		local day = this.World.getTime().Days;

		// Scale increases over time:
		// +1 every 50 days (early growth)
		// +1 every 100 days (mid game)
		// +1 every 150 days (late game)
		local scale = this.Math.floor(day/50) 
					+ this.Math.floor(day/100)
					+ this.Math.floor(day/150);

		// Limit scaling so it doesn't get out of control
		// Base softcap is 8, +1 extra every 100 days
		// This way, softcap is reached on day 300 and is 11
		// Practically, scaling stops at 300 for most players
		scale = this.Math.min(scale, 8 + this.Math.floor(day/100));

		// Additional difficulty modifier to the scaling - Minor effect
		local dMod = [0.90, 1.00, 1.10, 1.15][::World.Assets.getCombatDifficulty()];

		// Apply the scaling to stats (Flat Bonuses)
		// Example: at day 200 → scale = 7, 300 -> scale = 11
		_properties.MeleeSkill     += (1.00 * scale) * dMod;   // ~+7  - 11
		_properties.MeleeDefense   += (0.70 * scale) * dMod;   // ~+5  - 8
		_properties.RangedSkill    += (1.00 * scale) * dMod;   // ~+7  - 11
		_properties.RangedDefense  += (0.70 * scale) * dMod;   // ~+5  - 8
		_properties.Initiative	   += (1.00 * scale) * dMod;   // ~+7  - 11
		_properties.Bravery        += (1.50 * scale) * dMod;   // ~+10 - 16
		_properties.Hitpoints      += (2.50 * scale) * dMod;   // ~+17 - 27

		// Apply the scaling to stats (Multipliers)
		_properties.MeleeSkillMult     *= 1.0 + (((0.70 * scale) * dMod) / 100.0);   // ~+5  - 8 %
		_properties.MeleeDefenseMult   *= 1.0 + (((0.70 * scale) * dMod) / 100.0);   // ~+5  - 8 %
		_properties.RangedSkillMult    *= 1.0 + (((0.70 * scale) * dMod) / 100.0);   // ~+5  - 8 %
		_properties.RangedDefenseMult  *= 1.0 + (((0.70 * scale) * dMod) / 100.0);   // ~+5  - 8 %
		_properties.InitiativeMult     *= 1.0 + (((1.00 * scale) * dMod) / 100.0);   // ~+7  - 11 %
		_properties.BraveryMult        *= 1.0 + (((1.50 * scale) * dMod) / 100.0);   // ~+10 - 16 %
		_properties.HitpointsMult      *= 1.0 + (((1.00 * scale) * dMod) / 100.0);   // ~+7  - 11 %

		// These apply two scalings at once pretty much, one flat and one multiplier
		// As an example, a 300 Hp enemy on day 200 will get 340. a 100 Hp enemy will get 126
		// Similarly, on day 300: 300 Hp -> 364
		// Another example. Take an enemy with 90 Melee Attack: Day 200 -> 102, 300 -> 109
		// For a difficulty example: (on Beginner, day 200) 200 Hp -> 240. (on Legendary, day 200) 200Hp -> 250
	}

});

