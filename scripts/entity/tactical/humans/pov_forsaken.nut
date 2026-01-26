this.pov_forsaken <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovForsaken;
		this.m.BloodType = this.Const.BloodType.Green;
		this.m.XP = this.Const.Tactical.Actor.PovForsaken.XP;
		//this.m.Name = this.generateName(); // champion test
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.Military;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/military_melee_agent");
		this.m.AIAgent.setActor(this);
		this.m.SoundPitch = this.Math.rand(45, 65) * 0.01; // very low pitch, almost orky
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovForsaken);
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
		
		// Scaling stats and skills
		// scaling points: 25,50,100,150,200
		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.MeleeSkill += 4;
			b.Bravery += 10;
			b.Hitpoints += 5;

			if (day >= 50)
			{		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_true_believer"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smackdown"));				
				b.MeleeDefense += 4;
				b.MeleeSkill += 4;
				b.RangedDefense += 2;
				b.Hitpoints += 5;				

				if (day >= 100)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_muscularity"));				
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));				
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_perfect_fit"));						
					b.MeleeSkill += 4;			
					b.MeleeDefense += 5;
					b.RangedDefense += 2;			
					b.Bravery += 10;
					b.Hitpoints += 5;
					b.DamageTotalMult += 0.05;

					if (day >= 150)
					{
						b.MeleeSkill += 4;	
						b.Initiative += 4;
						b.RangedDefense += 2;
						b.Hitpoints += 5;									
						this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));							
						if (day >= 200)
						{
							b.MeleeSkill += 2;
							b.MeleeDefense += 2;
							b.RangedDefense += 2;	
							b.Initiative += 5;
							b.Bravery += 8;
							b.Hitpoints += 5;
							b.DamageTotalMult += 0.05;	

							if (day >= 250)
							{
								b.MeleeSkill += 2;
								b.MeleeDefense += 2;
								b.RangedDefense += 2;	
								b.Hitpoints += 5;							
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
			b.MeleeSkill     += 1.40 * scale;   // ~+10
			b.MeleeDefense   += 0.70 * scale;   // ~+5
			b.RangedSkill    += 1.40 * scale;   // ~+10
			b.RangedDefense  += 0.70 * scale;   // ~+5
			b.Bravery        += 1.40 * scale;   // ~+10
			b.Hitpoints      += 2.85 * scale;   // ~+20
		}

		// Beginner Modifiers
		if(("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
		{
			// Stats
			b.DamageTotalMult *= 0.90;
			b.RangedDefense -= 6;
			b.MeleeDefense -= 8;
			b.MeleeSkill -= 10;
			b.Hitpoints -= 25;
			b.Bravery -= 20;
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
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Default,::TLW.EnemyMut.Melee,false);

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
		// (Darker than usual and purple - Overrides Mutation Stuff)
		::TLW.MutantEffect.addForsakenEffect(this);	

		// Test - Make Champ
		//this.makeMiniboss();
	}

	// for champ test
	/*function generateName()
	{
		return this.Const.Strings.ForsakenNames[this.Math.rand(0, this.Const.Strings.ForsakenNames.len() - 1)] + " " + this.Const.Strings.ForsakenTitles[this.Math.rand(0, this.Const.Strings.ForsakenTitles.len() - 1)];
	}*/

	function assignRandomEquipment()
	{
		// Equipment (Weapons)
		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			// some heavy hitters, some lighter ones, chance for polearm
			local weapons = [
					"weapons/greataxe",
					"weapons/two_handed_flail",
					"weapons/legend_military_goedendag",
					"weapons/goedendag",					
					"weapons/two_handed_flanged_mace",
					"weapons/two_handed_mace",
					"weapons/legend_two_handed_club",
					"weapons/warbrand",
					"weapons/billhook",
					"weapons/longaxe"

			];
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));			
		}	
		//::Mod_Sellswords.HookHelper.addTreeOfEquippedWeapon(this);	

		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "forsaken_armor", helmet = "forsaken_helmet" }
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

		//::Mod_Sellswords.HookHelper.addTreeOfEquippedWeapon(this);
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));

		//Stats Modifiers
		this.m.BaseProperties.DamageDirectMult *= 1.1;		
		return true;
	}

});

