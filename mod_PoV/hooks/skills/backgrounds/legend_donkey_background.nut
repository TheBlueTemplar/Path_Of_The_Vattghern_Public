::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_donkey_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.CustomPerkTree = [
			[
				this.Legends.Perk.Colossus,
				this.Legends.Perk.NineLives,
				this.Legends.Perk.Pathfinder,
				this.Legends.Perk.Steadfast,
				this.Legends.Perk.BagsAndBelts,
				this.Legends.Perk.Recover
			],
			[
				this.Legends.Perk.Dodge,
				this.Legends.Perk.HoldOut,
				this.Legends.Perk.LegendComposure,
				this.Legends.Perk.LegendAlert,
				this.Legends.Perk.LegendOnslaught,
				this.Legends.Perk.SteelBrow,
				this.Legends.Perk.LegendRecuperation
			],
			[
				this.Legends.Perk.Anticipation,
				this.Legends.Perk.Rotation,
				this.Legends.Perk.LegendPeaceful,
				this.Legends.Perk.Taunt,
				this.Legends.Perk.LegendSprint
			],
			[
				this.Legends.Perk.LegendEfficientPacking,
				this.Legends.Perk.LegendAmmoBinding,
				this.Legends.Perk.LegendMedPackages,
				this.Legends.Perk.LegendToolsDrawers
				this.Legends.Perk.LegendQuickStep
			],
			[
				this.Legends.Perk.LoneWolf,
				this.Legends.Perk.Footwork,
				this.Legends.Perk.LegendLastStand,
				this.Legends.Perk.LegendBlendIn,
				this.Legends.Perk.Underdog
			],
			[
				this.Legends.Perk.Nimble,
				this.Legends.Perk.LegendRebound,
				this.Legends.Perk.LegendPacifist,
				this.Legends.Perk.LegendSkillfulStacking,
				this.Legends.Perk.LegendMuscularity,
			],
			[
				this.Legends.Perk.Fearsome,
				this.Legends.Perk.Stalwart,
				this.Legends.Perk.LegendAmmoBundles,
				this.Legends.Perk.LegendMedIngredients,
				this.Legends.Perk.LegendToolsSpares,
			],
			[],
			[],
			[],
			[]
		];
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if (::World.Assets.getOrigin() != null)
		{
			if (::World.Assets.getOrigin().getID() == "scenario.pov_donkeys")
			{
				ret.push(
					{
						id = 13,
						type = "text",
						icon = "ui/icons/special.png",
						text = "(Because of Scenario:) +15% Hp, +10% Damage and Damage Resistance, +10% Melee Attack, +10% Resolve, -25% Food Consumed."
					}
				);
			}
		}		
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		if (::World.Assets.getOrigin() != null)
		{
			if (::World.Assets.getOrigin().getID() == "scenario.pov_donkeys")
			{
				_properties.DamageReceivedRegularMult *= 0.90;
				_properties.DamageTotalMult *= 1.10; 
				_properties.HitpointsMult *= 1.15;
				_properties.MeleeSkillMult *= 1.10;
				_properties.BraveryMult *= 1.10;
				_properties.DailyFood *= 0.75;
			}	
		}	
	}
})
