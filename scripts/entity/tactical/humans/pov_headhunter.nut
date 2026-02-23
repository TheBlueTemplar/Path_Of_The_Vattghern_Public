this.pov_headhunter <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovHeadhunter;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.PovHeadhunter.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_ranged_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovHeadhunter);
		b.TargetAttractionMult = 1.1;
		b.Vision = 8;
		b.IsSpecializedInBows = true;
		b.IsSpecializedInCrossbows = true;
		b.IsSpecializedInDaggers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");

		// Base skills/traits/perks
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/footwork"));
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
		
		::Legends.Perks.grant(this, ::Legends.Perk.Footwork);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendBallistics);
		::Legends.Traits.grant(this, ::Legends.Trait.Fearless);
		::Legends.Perks.grant(this, ::Legends.Perk.CripplingStrikes);
		::Legends.Perks.grant(this, ::Legends.Perk.Steadfast);
		// Scaling stats and skills
		// scaling points: 25,50,100,150,200
		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.RangedSkill += 2;
			b.Bravery += 3;
			b.Hitpoints += 2;

			if (day >= 50)
			{						
				b.MeleeDefense += 3;
				b.RangedSkill += 2;
				b.RangedDefense += 2;
				b.Hitpoints += 4;				

				if (day >= 100)
				{								
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));						
					b.RangedSkill += 2;			
					b.MeleeDefense += 4;
					b.RangedDefense += 1;			
					b.Bravery += 3;
					b.Hitpoints += 3;
					b.DamageTotalMult += 0.05;

					if (day >= 150)
					{
						b.RangedSkill += 3;	
						b.Initiative += 2;
						b.RangedDefense += 2;
						b.Hitpoints += 3;	
						this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));								
												
						if (day >= 200)
						{
							b.RangedSkill += 2;
							b.MeleeDefense += 2;
							b.RangedDefense += 2;	
							b.Initiative += 2;
							b.Bravery += 4;
							b.Hitpoints += 2;
							b.DamageTotalMult += 0.05;	
							this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_perfect_fit"));

							if (day >= 250)
							{
								b.RangedSkill += 2;
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
			::Legends.Perks.grant(this, ::Legends.Perk.NineLives);
			::Legends.Perks.grant(this, ::Legends.Perk.Pathfinder);
			::Legends.Perks.grant(this, ::Legends.Perk.LoneWolf);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendLookout);
			::Legends.Perks.grant(this, ::Legends.Perk.Berserk);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendPointBlank);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendClarity);

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
			b.MeleeDefense   += 1.00 * scale;   // ~+7
			b.RangedSkill    += 1.40 * scale;   // ~+10
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
			b.MeleeSkill -= 5;
			b.RangedSkill -= 10;
			b.Hitpoints -= 25;
			b.Bravery -= 15;
		}

		// CORPSE - MUTATION STUFF
		
		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Enemy Mutation System
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Ranged,false);
		
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
		// Equipment (Weapons)
		local r = this.Math.rand(1, 2);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/war_bow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/heavy_crossbow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}

		r = this.Math.rand(1, 5);

		if (r == 1 || r == 2)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/rondel_dagger"));
		}
		else if (r == 2)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/arming_sword"));
		}
		else if (r == 3)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/hand_axe"));
		}
		else if (r == 4)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/morning_star"));
		}

		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "pov_headhunter_armor", helmet = "pov_headhunter_helmet" }
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
		local weapons = [
			[
				"weapons/named/named_warbow",
				"ammo/quiver_of_arrows"
			],
			[
				"weapons/named/named_crossbow",
				"ammo/quiver_of_bolts"
			]
		];
		
		local r = this.Math.rand(0, weapons.len() - 1);
		foreach( w in weapons[r] )
		{
			this.m.Items.equip(this.new("scripts/items/" + w));
		}

		//Stats Modifiers
		this.m.BaseProperties.DamageDirectMult *= 1.05;		
		return true;
	}

});

