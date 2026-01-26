this.pov_rogue_seer <- this.inherit("scripts/entity/tactical/human", {
	m = {
		IsLow = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovRogueSeer;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.PovRogueSeer.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/pov_seer_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovRogueSeer);
		b.TargetAttractionMult = 1.1;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		b.IsSpecializedInStaffStun = true;
		b.IsSpecializedInStaves = true;
		b.Vision = 8;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_bandits");

		// Drops
		this.actor.m.OnDeathLootTable.push([15,"scripts/items/misc/legend_ancient_scroll_item"]);

		// Actives
		::Legends.Actives.grant(this, ::Legends.Active.LegendMagicMissile);
		::Legends.Actives.grant(this, ::Legends.Active.LegendMagicDaze);
		::Legends.Actives.grant(this, ::Legends.Active.LegendStun);
		::Legends.Actives.grant(this, ::Legends.Active.LegendChainLightning);
		::Legends.Actives.grant(this, ::Legends.Active.LegendRevolt);
		::Legends.Actives.grant(this, ::Legends.Active.LegendEntice);
		// Base skills/traits/perks.
		::Legends.Perks.grant(this, ::Legends.Perk.Recover);
		::Legends.Perks.grant(this, ::Legends.Perk.Nimble);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendSpecStaffStun);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendSpecialistSelfdefense);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendMagicMissileFocus);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendMagicMissileMastery);
		::Legends.Perks.grant(this, ::Legends.Perk.Overwhelm);

		// Scaling stats and skills
		// scaling points: 25,50,100,150,200
		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.RangedSkill += 1;
			b.Bravery += 3;
			b.Hitpoints += 4;
			b.Initiative += 1;
			::Legends.Perks.grant(this, ::Legends.Perk.LegendTrueBeliever);

			if (day >= 50)
			{		
								
				b.MeleeDefense += 1;
				b.RangedSkill += 2;
				b.Initiative += 2;
				b.RangedDefense += 2;
				b.Hitpoints += 4;
				b.DamageTotalMult += 0.03;
				::Legends.Perks.grant(this, ::Legends.Perk.LegendTerrifyingVisage);				

				if (day >= 100)
				{										
					b.MeleeDefense += 1;
					b.RangedSkill += 2;
					b.Initiative += 3;
					b.RangedDefense += 2;
					b.Hitpoints += 4;			
					b.Bravery += 3;
					b.DamageTotalMult += 0.05;
					::Legends.Perks.grant(this, ::Legends.Perk.Relentless);

					if (day >= 150)
					{
						b.MeleeSkill += 2;	
						b.Initiative += 4;
						b.MeleeDefense += 1;
						b.RangedSkill += 2;
						b.RangedDefense += 3;
						b.Hitpoints += 4;			
						b.Bravery += 3;
						::Legends.Perks.grant(this, ::Legends.Perk.Anticipation);		

						if (day >= 200)
						{
							b.MeleeSkill += 2;	
							b.Initiative += 4;
							b.MeleeDefense += 1;
							b.RangedSkill += 2;
							b.RangedDefense += 3;
							b.Hitpoints += 4;			
							b.Bravery += 3;	
							b.DamageTotalMult += 0.05;	
							::Legends.Perks.grant(this, ::Legends.Perk.LoneWolf);	

							if (day >= 250)
							{
								b.MeleeSkill += 4;	
								b.Initiative += 5;
								b.MeleeDefense += 2;
								b.RangedSkill += 3;
								b.RangedDefense += 3;
								b.Hitpoints += 5;			
								b.Bravery += 3;								
							}						
						}						
					}		
				}
			}
		}

		// DIFFICULTY MODIFIERS
		// Legendary Modifiers (scaled with days)
		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			// legendary - only perks
			::Legends.Perks.grant(this, ::Legends.Perk.LegendSecondWind);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendAlert);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendClarity);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendFeint);

			// stable stat increase
			b.DamageTotalMult *= 1.05;
			// Scaled stat increase
			local day = this.World.getTime().Days;

			// Scale increases over time:
			// +1 every 50 days (early growth)
			// +1 every 100 days (mid game)
			// +1 every 150 days (late game)
			local scale = this.Math.floor(day/50) + this.Math.floor(day/100) + this.Math.floor(day/150);

			// Limit scaling so it doesn't get out of control
			// Base softcap is 8, +1 extra every 100 days
			// This way, softcap is reached on day 250
			scale = this.Math.min(scale, 8 + this.Math.floor(day/100));

			// Apply the scaling to stats
			// Example: at day 200 → scale = 7
			b.MeleeSkill     += 0.70 * scale;   // ~+5
			b.MeleeDefense   += 0.70 * scale;   // ~+5
			b.RangedSkill    += 1.40 * scale;   // ~+10
			b.RangedDefense  += 1.00 * scale;   // ~+7
			b.Bravery        += 2.10 * scale;   // ~+15
			b.Initiative	 += 2.10 * scale;	// ~+15
			b.Hitpoints      += 1.40 * scale;   // ~+10
		}

		// Beginner Modifiers
		if(("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
		{
			// Stats
			b.DamageTotalMult *= 0.90;
			b.RangedDefense -= 5;
			b.MeleeDefense -= 5;
			b.MeleeSkill -= 5;
			b.RangedSkill -= 8;
			b.Initiative -= 10;
			b.Hitpoints -= 10;
			b.Bravery -= 5;
		}

		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Enemy Mutation System
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Ranged,false);

		// Visuals
		this.setArmorSaturation(0.85);
		this.getSprite("shield_icon").setBrightness(0.85);
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setArmorBrightness(0.9);
		this.setDirty(true);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled() && _skill != null && _skill.isRanged())
		{
			this.updateAchievement("TasteYourOwnMedicine", 1, 1);
		}

		this.human.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function assignRandomEquipment()
	{
		// Equipment (Weapons)
		this.m.Items.equip(this.new("scripts/items/weapons/pov_rough_staff"));
		
		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "pov_rogue_seer_armor", helmet = "pov_rogue_seer_helmet" }
		];

		local r = this.Math.rand(0, equipmentSets.len() - 1);
		local selectedSet = equipmentSets[r];
		this.m.Items.equip(this.Const.World.Common.pickArmor([[ 1, selectedSet.armor ]]));
		this.m.Items.equip(this.Const.World.Common.pickHelmet([[ 1, selectedSet.helmet ]]));
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");	
		
		//Perks
		::Legends.Perks.grant(this, ::Legends.Perk.CripplingStrikes);
		::Legends.Perks.grant(this, ::Legends.Perk.Dodge);	

		//Named Stuff
		this.m.Items.equip(this.new("scripts/items/weapons/named/pov_named_rough_staff"));

		//Additional Perks
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));

		//Stats Modifiers
		local b = this.m.BaseProperties;
		b.ActionPoints += 2;
		//b.DamageTotalMult *= 1.05;
		b.Hitpoints += 30;
		b.Armor[this.Const.BodyPart.Head] += 25;
		b.ArmorMax[this.Const.BodyPart.Head] += 25;
		b.Armor[this.Const.BodyPart.Body] += 30;
		b.ArmorMax[this.Const.BodyPart.Body] += 30;

		return true;
	}

});

