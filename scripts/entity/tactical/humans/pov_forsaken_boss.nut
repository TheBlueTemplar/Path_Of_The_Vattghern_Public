this.pov_forsaken_boss <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		// Enemy Variant thats always a champion
		this.m.Type = this.Const.EntityType.PovForsaken_Boss;
		this.m.BloodType = this.Const.BloodType.Green;
		this.m.XP = this.Const.Tactical.Actor.PovForsaken_Boss.XP;
		this.m.Name = this.generateName(); // autochamp
		this.m.IsGeneratingKillName = false;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.Military;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/military_melee_agent");
		this.m.AIAgent.setActor(this);
		this.m.SoundPitch = this.Math.rand(40, 60) * 0.01; // very low pitch, almost orky
		this.m.OnDeathLootTable.extend([
			[1, "scripts/items/misc/legend_masterwork_fabric"],
			[1, "scripts/items/misc/legend_masterwork_metal"],
			[1, "scripts/items/misc/legend_masterwork_tools"]
		]);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovForsaken_Boss);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_military");

		// Base skills/traits/perks
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));					
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));	
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));	
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));				
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
		
		// Scaling stats and skills
		// scaling points: 25,50,100,150,200
		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.MeleeSkill += 5;
			b.Bravery += 11;
			b.Hitpoints += 7;

			if (day >= 50)
			{		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_true_believer"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smackdown"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));				
				b.MeleeDefense += 5;
				b.MeleeSkill += 5;
				b.RangedDefense += 3;
				b.Hitpoints += 6;				

				if (day >= 100)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_muscularity"));				
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));				
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_perfect_fit"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_last_stand"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_battleheart"));								
					b.MeleeSkill += 5;			
					b.MeleeDefense += 6;
					b.RangedDefense += 3;			
					b.Bravery += 12;
					b.Hitpoints += 6;
					b.DamageTotalMult += 0.07;

					if (day >= 150)
					{
						b.MeleeSkill += 5;	
						b.Initiative += 5;
						b.RangedDefense += 4;
						b.Hitpoints += 7;
						b.DamageTotalMult += 0.07;																
						if (day >= 200)
						{
							b.MeleeSkill += 3;
							b.MeleeDefense += 3;
							b.RangedDefense += 3;	
							b.Initiative += 6;
							b.Bravery += 9;
							b.Hitpoints += 7;
							b.DamageTotalMult += 0.07;	

							if (day >= 250)
							{
								b.MeleeSkill += 3;
								b.MeleeDefense += 3;
								b.RangedDefense += 3;	
								b.Hitpoints += 7;
								b.DamageTotalMult += 0.07;							
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
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));				
			this.m.Skills.add(this.new("scripts/skills/traits/iron_jaw_trait"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));	

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
			b.MeleeSkill     += 1.70 * scale;   // ~+12
			b.MeleeDefense   += 1.00 * scale;   // ~+7
			b.RangedSkill    += 1.70 * scale;   // ~+12
			b.RangedDefense  += 1.00 * scale;   // ~+7
			b.Bravery        += 1.70 * scale;   // ~+12
			b.Hitpoints      += 3.50 * scale;   // ~+25
		}

		// Beginner Modifiers
		if(("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
		{
			// Stats
			b.DamageTotalMult *= 0.85;
			b.RangedDefense -= 10;
			b.MeleeDefense -= 12;
			b.MeleeSkill -= 15;
			b.Hitpoints -= 40;
			b.Bravery -= 30;
		}

		// CORPSE - MUTATION STUFF
		
		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push(::TLW.CorpseDrop.getCorpseDrop(actor, ::TLW.Corpse.Forsaken));
	  	}
		
		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Enemy Mutation System
		// Tweaked in this case, 2 iterations of mutations, one 100%, one normal one
		// 2 - max 4 mutations total
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Always,::TLW.EnemyMut.Melee,false);
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Always,::TLW.EnemyMut.Melee,false);

		// VISUALS

		// Add random injury sprite
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

		// Scars
		local tattoo_body = this.getSprite("tattoo_body");
		local tattoo_head = this.getSprite("tattoo_head");
		local body = this.getSprite("body");
		if (this.Math.rand(1, 100) <= 66)
		{
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 66)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;	
		}

		// Change Skin Tone Appearance (Random "mutant" hue selection)
		local body = this.getSprite("body");
		local head = this.getSprite("head");

		// Color options: #a8c470 - Light Effect (unused) || #a1bf63 - kinda orky || #b4c754 - in between || #455bd1 - blue || #cc623b - Brown || #7d48d4 - Purple
		local colorVariants = ["#b4c754","#a1bf63","#455bd1","#cc623b","#7d48d4"];
		local skinColor = colorVariants[this.Math.rand(0 , colorVariants.len() - 1)];

		body.Color = this.createColor(skinColor);
		body.varyColor(0.07, 0.07, 0.07);
		body.varySaturation(0.05);

		//head.setBrush(this.m.Faces[this.Math.rand(0, this.m.Faces.len() - 1)]);
		head.Color = this.createColor(skinColor);
		head.varyColor(0.07, 0.07, 0.07);
		head.varySaturation(0.05);
		//this.setAppearance(); // apply changes

		// Add Special Mutant Effect 
		// (Darker and larger than usual and red - Overrides Mutation Stuff)
		::TLW.MutantEffect.addForsakenBossEffect(this);	
	}

	// auto champ enemy
	function generateName()
	{
		return this.Const.Strings.ForsakenBossNames[this.Math.rand(0, this.Const.Strings.ForsakenBossNames.len() - 1)] + " " + this.Const.Strings.ForsakenBossTitles[this.Math.rand(0, this.Const.Strings.ForsakenBossTitles.len() - 1)];
	}

	function assignRandomEquipment()
	{
		// Equipment (Weapons)
		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			// some heavy hitters, some lighter ones, chance for polearm
			local weapons = [
					"weapons/named/named_greataxe",
					"weapons/named/named_two_handed_flail",
					"weapons/named/legend_named_military_goedendag",					
					"weapons/named/named_two_handed_mace",
					"weapons/named/named_two_handed_hammer",
					"weapons/named/named_warbrand",
					"weapons/named/named_billhook",
					"weapons/named/named_longaxe",

			];
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}	

		// Equipment (Armor, Helmets)
		// Both Armor and Helm Include Guaranteed Tier 2 Named Item!
		local equipmentSets = [
			{ armor = "forsaken_boss_armor", helmet = "forsaken_boss_helmet" }
		];

		local r = this.Math.rand(0, equipmentSets.len() - 1);
		local selectedSet = equipmentSets[r];
		this.m.Items.equip(this.Const.World.Common.pickArmor([[ 1, selectedSet.armor ]]));
		this.m.Items.equip(this.Const.World.Common.pickHelmet([[ 1, selectedSet.helmet ]]));
	}

	// Always a champion
	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		// unique champ bust. Will likely make it so for other special enemy champs
		this.getSprite("miniboss").setBrush("pov_forsaken_boss_bust");
		return true;
	}

});

