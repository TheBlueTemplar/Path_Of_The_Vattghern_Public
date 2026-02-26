this.pov_noble_gunner_knight <- this.inherit("scripts/entity/tactical/human", {
	m = {
		IsLow = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovGunnerKnight;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.PovGunnerKnight.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/pov_gunner_hybrid_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovGunnerKnight);
		b.TargetAttractionMult = 1.15;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		b.IsSpecializedInCrossbows = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInMaces = true;
		b.Vision = 8;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_military");

		// Base skills/traits/perks
		::Legends.Perks.grant(this, ::Legends.Perk.LegendLastStand);
		::Legends.Perks.grant(this, ::Legends.Perk.Rotation);
		::Legends.Perks.grant(this, ::Legends.Perk.Recover);
		::Legends.Perks.grant(this, ::Legends.Perk.Overwhelm);
		::Legends.Perks.grant(this, ::Legends.Perk.Brawny);

		// Scaling stats and skills
		// scaling points: 25,50,100,150,200
		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.RangedSkill += 1;
			b.MeleeSkill += 1;
			b.Bravery += 2;
			b.Hitpoints += 4;

			if (day >= 50)
			{		
				::Legends.Perks.grant(this, ::Legends.Perk.BattleForged);				
				b.MeleeDefense += 1;
				b.RangedSkill += 2;
				b.MeleeSkill += 2;
				b.RangedDefense += 2;
				b.Hitpoints += 5;				

				if (day >= 100)
				{										
					b.MeleeDefense += 2;
					b.RangedSkill += 3;
					b.RangedDefense += 3;
					b.Hitpoints += 6;			
					b.Bravery += 4;
					b.DamageTotalMult += 0.05;
					::Legends.Perks.grant(this, ::Legends.Perk.SteelBrow);					

					if (day >= 150)
					{
						b.MeleeSkill += 3;	
						b.Initiative += 4;
						b.MeleeDefense += 2;
						b.RangedSkill += 3;
						b.RangedDefense += 3;
						b.Hitpoints += 7;			
						b.Bravery += 4;
						::Legends.Perks.grant(this, ::Legends.Perk.Underdog);		

						if (day >= 200)
						{
							b.MeleeSkill += 3;	
							b.Initiative += 4;
							b.MeleeDefense += 2;
							b.RangedSkill += 3;
							b.RangedDefense += 3;
							b.Hitpoints += 7;			
							b.Bravery += 4;	
							b.DamageTotalMult += 0.05;	
							::Legends.Perks.grant(this, ::Legends.Perk.LoneWolf);	

							if (day >= 250)
							{
								b.MeleeSkill += 5;	
								b.Initiative += 5;
								b.MeleeDefense += 4;
								b.RangedSkill += 5;
								b.RangedDefense += 4;
								b.Hitpoints += 12;			
								b.Bravery += 7;	
								::Legends.Perks.grant(this, ::Legends.Perk.Fearsome);
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
			::Legends.Perks.grant(this, ::Legends.Perk.LegendBallistics);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendPointBlank);
			::Legends.Perks.grant(this, ::Legends.Perk.CripplingStrikes);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendImmovableObject);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendBackToBasics);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendFeint);
			::Legends.Traits.grant(this, ::Legends.Trait.Fearless);

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
			b.MeleeSkill     += 1.40 * scale;   // ~+10
			b.MeleeDefense   += 1.00 * scale;   // ~+7
			b.RangedSkill    += 2.10 * scale;   // ~+15
			b.RangedDefense  += 1.00 * scale;   // ~+7
			b.Bravery        += 2.10 * scale;   // ~+15
			b.Hitpoints      += 3.50 * scale;   // ~+25
		}

		// Beginner Modifiers
		if(("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
		{
			// Stats
			b.DamageTotalMult *= 0.90;
			b.RangedDefense -= 6;
			b.MeleeDefense -= 6;
			b.MeleeSkill -= 8;
			b.RangedSkill -= 8;
			b.Hitpoints -= 25;
			b.Bravery -= 15;
		}

		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Enemy Mutation System
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Melee,false);

		this.setArmorSaturation(0.90);
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
		// Tabard!
		local r;
		local banner = 4;

		if (("State" in this.Tactical) && this.Tactical.State != null && !this.Tactical.State.isScenarioMode())
		{
			banner = this.World.FactionManager.getFaction(this.getFaction()).getBanner();
		}
		else
		{
			banner = this.getFaction();
		}

		this.m.Surcoat = banner;

		if (this.Math.rand(1, 100) <= 75) // 75% chance
		{
			this.getSprite("surcoat").setBrush("surcoat_" + (banner < 10 ? "0" + banner : banner));
		}

		// Equipment (Weapons)
		this.m.Items.equip(this.new("scripts/items/weapons/pov_feuerspeier"));
		this.m.Items.equip(this.new("scripts/items/ammo/powder_bag"));

		/*local r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/fighting_axe"));
		}
		else if (r == 2)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/noble_sword"));
		}
		else if (r == 3)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/winged_mace"));
		}
		else if (r == 4)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/warhammer"));
		}*/
		
		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "pov_gunner_knight_armor", helmet = "pov_gunner_knight_helmet" }
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

		//Named Stuff (1 Weapon, and 1 Armor OR Helmet)
		this.m.Items.equip(this.new("scripts/items/weapons/named/pov_named_feuerspeier"));

		local r = this.Math.rand(1, 2)
		if (r == 1)
		{
			this.m.Items.equip(this.Const.World.Common.pickArmor([
				[3, ::Legends.Armor.Named.brown_coat_of_plates_armor],
				[3, ::Legends.Armor.Named.golden_scale_armor],
				[3, ::Legends.Armor.Named.green_coat_of_plates_armor],
				[3, ::Legends.Armor.Named.heraldic_mail_armor],
			]));
		}else
		{
			this.m.Items.equip(this.Const.World.Common.pickHelmet([
				[3, ::Legends.Helmet.Named.legend_frogmouth_helm_crested_painted],
				[3, ::Legends.Helmet.Named.bascinet_named],
				[3, ::Legends.Helmet.Named.deep_cervelliere_named],
				[3, ::Legends.Helmet.Named.barbute_named],
				[3, ::Legends.Helmet.Named.italo_norman_helm_named],
				[3, ::Legends.Helmet.Named.legend_helm_full_named]
			]));
		}
		

		//Additional Perks
		::Legends.Perks.grant(this, ::Legends.Perk.Fearsome);
		::Legends.Perks.grant(this, ::Legends.Perk.KillingFrenzy);
		::Legends.Perks.grant(this, ::Legends.Perk.HoldOut);

		//Stats Modifiers
		local b = this.m.BaseProperties;
		b.Bravery += 10;
		b.DamageDirectMult *= 1.1;

		return true;
	}

});

