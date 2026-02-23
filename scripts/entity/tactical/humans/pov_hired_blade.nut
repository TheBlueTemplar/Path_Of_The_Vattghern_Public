this.pov_hired_blade <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovHiredBlade;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.PovHiredBlade.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovHiredBlade);
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
		this.getSprite("socket").setBrush("bust_base_militia");

		// Base skills/traits/perks
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));

		// Gain Either Lithe or Battleforged
		local b = this.Math.rand(1,2);
		if (b == 1)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		}
		else
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_lithe"));
		}
		

		::Legends.Perks.grant(this, ::Legends.Perk.LegendRebound);
		::Legends.Perks.grant(this, ::Legends.Perk.Stalwart);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendSmashingShields);
		::Legends.Perks.grant(this, ::Legends.Perk.CripplingStrikes);
		::Legends.Traits.grant(this, ::Legends.Trait.Fearless);
		::Legends.Perks.grant(this, ::Legends.Perk.Steadfast);
		::Legends.Perks.grant(this, ::Legends.Perk.Berserk);
		// Scaling stats and skills
		// scaling points: 25,50,100,150,200
		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.MeleeSkill += 2;
			b.Bravery += 4;
			b.Hitpoints += 3;

			if (day >= 50)
			{		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_true_believer"));				
				b.MeleeDefense += 3;
				b.MeleeSkill += 2;
				b.RangedDefense += 2;
				b.Hitpoints += 4;				

				if (day >= 100)
				{								
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));						
					b.MeleeSkill += 2;			
					b.MeleeDefense += 4;
					b.RangedDefense += 1;			
					b.Bravery += 3;
					b.Hitpoints += 3;
					b.DamageTotalMult += 0.05;

					if (day >= 150)
					{
						b.MeleeSkill += 3;	
						b.Initiative += 2;
						b.RangedDefense += 2;
						b.Hitpoints += 3;	
						this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));
						this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smackdown"));								
												
						if (day >= 200)
						{
							b.MeleeSkill += 2;
							b.MeleeDefense += 2;
							b.RangedDefense += 2;	
							b.Initiative += 2;
							b.Bravery += 4;
							b.Hitpoints += 2;
							b.DamageTotalMult += 0.05;	
							this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_perfect_fit"));

							if (day >= 250)
							{
								b.MeleeSkill += 2;
								b.MeleeDefense += 2;
								b.RangedDefense += 2;	
								b.Hitpoints += 5;
								this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_muscularity"));							
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
			this.m.Skills.add(this.new("scripts/skills/traits/iron_jaw_trait"));
			::Legends.Perks.grant(this, ::Legends.Perk.Colossus);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendClarity);
			::Legends.Perks.grant(this, ::Legends.Perk.Footwork);
			::Legends.Perks.grant(this, ::Legends.Perk.Underdog);
			::Legends.Perks.grant(this, ::Legends.Perk.SteelBrow);	

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
			b.MeleeSkill     += 1.00 * scale;   // ~+7
			b.MeleeDefense   += 1.00 * scale;   // ~+7
			b.RangedSkill    += 1.00 * scale;   // ~+7
			b.RangedDefense  += 1.00 * scale;   // ~+7
			b.Bravery        += 1.40 * scale;   // ~+10
			b.Hitpoints      += 2.85 * scale;   // ~+20
		}

		// Beginner Modifiers
		if(("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
		{
			// Stats
			b.DamageTotalMult *= 0.90;
			b.RangedDefense -= 7;
			b.MeleeDefense -= 7;
			b.MeleeSkill -= 10;
			b.Hitpoints -= 25;
			b.Bravery -= 15;
		}

		// CORPSE - MUTATION STUFF
		
		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Enemy Mutation System
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Melee,false);
		
		//Visuals

		// Scars
		local tattoo_body = this.getSprite("tattoo_body");
		local tattoo_head = this.getSprite("tattoo_head");
		local body = this.getSprite("body");
		if (this.Math.rand(1, 100) <= 50)
		{
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;	
		}

	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r;

		// Equipment (Weapons)
		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			// 1 2h, 5 poles, 9 1h: 60%1h, 40%2h
			local weapons = [
					"weapons/pike",//
					"weapons/legend_longsword",//
					"weapons/fighting_axe",
					"weapons/fighting_spear",
					"weapons/legend_battle_glaive",//
					"weapons/morning_star",
					"weapons/noble_sword",
					"weapons/military_pick",
					"weapons/legend_ranged_flail",//
					"weapons/polehammer",
					"weapons/three_headed_flail",
					"weapons/scimitar",			
					"weapons/billhook",//
					"weapons/military_cleaver",
					"weapons/pov_whip_mace"//
			];
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));			
		}

		// Equipment (Shields)
		// if one handing, 70% chance for shield, 30% for net
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			if (this.Math.rand(1, 100) <= 70)
			{
				r = this.Math.rand(0, 2);

				if (r == 0)
				{
					this.m.Items.equip(this.new("scripts/items/shields/pov_steel_buckler_shield"));
				}
				else if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/shields/heater_shield"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/shields/kite_shield"));
				}
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/tools/throwing_net"));
			}
		}

		// Equipment (Thrown)
		// 60% to also have a throwing thing
		if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 60)
		{
			r = this.Math.rand(1, 3);

			if (r == 1)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
			}
			else if (r == 2)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
			}
			else if (r == 3)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
			}
		}

		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "pov_hired_blade_armor", helmet = "pov_hired_blade_helmet" }
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
		
		// Named Weps
		local weapons = [ //45% 2h, 55% 1h
			"weapons/named/legend_named_glaive",//			
			"weapons/named/named_warbrand",//
			"weapons/named/named_billhook",//
			"weapons/named/named_longaxe",//
			"weapons/named/named_axe",
			"weapons/named/named_spear",
			"weapons/named/named_mace",
			"weapons/named/named_sword",
			"weapons/named/legend_named_warhammer",
			"weapons/named/named_three_headed_flail",
			"weapons/named/named_polehammer",//
			"weapons/named/named_cleaver",
			"weapons/named/pov_whip_mace_named"//
			
		];
		
		this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));

		// Bonus Perks
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));

		//Stats Modifiers
		this.m.BaseProperties.DamageDirectMult *= 1.05;		
		return true;
	}

});

