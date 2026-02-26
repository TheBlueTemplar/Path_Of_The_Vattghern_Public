this.pov_company_leader <- this.inherit("scripts/entity/tactical/human", {
	m = {
		IsLow = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovCompanyLeader;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.PovCompanyLeader.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/military_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovCompanyLeader);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInThrowing = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_military");
		this.getSprite("accessory_special").setBrush("sergeant_trophy");

		// Base skills/traits/perks
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));

		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain")); // boost

		::Legends.Perks.grant(this, ::Legends.Perk.LegendLastStand);
		::Legends.Perks.grant(this, ::Legends.Perk.BattleForged);
		::Legends.Actives.grant(this, ::Legends.Active.RallyTheTroops);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendComposure);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendFeint);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendBackToBasics);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendImmovableObject);

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

		if (this.Math.rand(1, 100) <= 33)
		{
			local r = this.Math.rand(1, 4);

			if (r == 1)
			{
				local sprite = this.getSprite("permanent_injury_4");
				sprite.setBrush("permanent_injury_04");
				sprite.Visible = true;
			}
			else if (r == 2)
			{
				local sprite = this.getSprite("permanent_injury_2");
				sprite.setBrush("permanent_injury_02");
				sprite.Visible = true;
			}
			else if (r == 3)
			{
				local sprite = this.getSprite("permanent_injury_1");
				sprite.setBrush("permanent_injury_01");
				sprite.Visible = true;
			}
			else if (r == 4)
			{
				local sprite = this.getSprite("permanent_injury_scarred");
				sprite.setBrush("permanent_injury_scarred");
				sprite.Visible = true;
			}
		}

		this.setArmorSaturation(0.90);
		this.getSprite("shield_icon").setBrightness(0.85);
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setArmorBrightness(0.9);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		// Equipment (Weapons)
		local weapons = [
			"weapons/warhammer",
			"weapons/fighting_axe",
			"weapons/arming_sword",
			"weapons/winged_mace",
			"weapons/hand_axe",
			"weapons/military_cleaver",
			"weapons/legend_swordstaff",
			"weapons/legend_infantry_axe",
		];

		this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		
		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "pov_company_leader_armor", helmet = "pov_company_leader_helmet" }
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

		this.m.Items.equip(this.Const.World.Common.pickArmor([
			[3, ::Legends.Armor.Named.brown_coat_of_plates_armor],
			[3, ::Legends.Armor.Named.golden_scale_armor],
			[3, ::Legends.Armor.Named.green_coat_of_plates_armor],
			[3, ::Legends.Armor.Named.heraldic_mail_armor],
		]));
		this.m.Items.equip(this.Const.World.Common.pickHelmet([
			[3, ::Legends.Helmet.Named.legend_frogmouth_helm_crested_painted],
			[3, ::Legends.Helmet.Named.bascinet_named],
			[3, ::Legends.Helmet.Named.deep_cervelliere_named],
			[3, ::Legends.Helmet.Named.barbute_named],
			[3, ::Legends.Helmet.Named.italo_norman_helm_named],
			[3, ::Legends.Helmet.Named.legend_helm_full_named]
		]));
		

		//Additional Perks
		::Legends.Perks.grant(this, ::Legends.Perk.Fearsome);
		::Legends.Perks.grant(this, ::Legends.Perk.KillingFrenzy);
		::Legends.Perks.grant(this, ::Legends.Perk.HoldOut);

		//Stats Modifiers
		local b = this.m.BaseProperties;
		b.Bravery += 10;

		return true;
	}

});

