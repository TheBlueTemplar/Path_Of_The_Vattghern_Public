this.pov_rogue_vattghern <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovRogueVattghern;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.PovRogueVattghern.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
		this.m.OnDeathLootTable.extend([
			[1.5, "scripts/items/misc/legend_masterwork_fabric"],
			[1.5, "scripts/items/misc/legend_masterwork_metal"],
			[1.5, "scripts/items/misc/legend_masterwork_tools"],
			[100, "scripts/items/misc/anatomist/pov_witcher_potion_item"] // goated loooot
		]);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovRogueVattghern);
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
		this.getSprite("accessory_special").setBrush("pov_vattghern_medallion"); // medallion gfx

		// Base skills/traits/perks
		// Gets sign intensity and regen via vattghern_enemy trait further below
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));

		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_lithe"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));

		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain")); // boost

		this.m.Skills.add(this.new("scripts/skills/traits/pov_monster_hunter_trait"));

		::Legends.Perks.grant(this, ::Legends.Perk.LegendRebound);
		::Legends.Perks.grant(this, ::Legends.Perk.Stalwart);
		::Legends.Perks.grant(this, ::Legends.Perk.LegendSmashingShields);
		::Legends.Perks.grant(this, ::Legends.Perk.CripplingStrikes);
		::Legends.Traits.grant(this, ::Legends.Trait.Fearless);
		::Legends.Perks.grant(this, ::Legends.Perk.Steadfast);
		::Legends.Perks.grant(this, ::Legends.Perk.Berserk);

		// Vattghern Signs
		// They all have 3 Turns Cooldown Individually. Scaled at 50% Sign Intensity Total
		this.m.Skills.add(this.new("scripts/skills/actives/pov_igni_skill")); // fire sweep
		this.m.Skills.add(this.new("scripts/skills/actives/pov_aard_skill")); // handgonne aoe melee dmg + push + stagger
		this.m.Skills.add(this.new("scripts/skills/actives/pov_bront_skill")); // chain lightting
		this.m.Skills.add(this.new("scripts/skills/actives/pov_axii_skill")); // ranged chance to stun + daze + stagger
		this.m.Skills.add(this.new("scripts/skills/actives/pov_quen_skill")); // shield + reflect dmg

		// for axii to work xd
		this.m.AIAgent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_distract"));
		this.getAIAgent().finalizeBehaviors();

		// Scaling stats and skills
		// scaling points: 25,50,100,150,200

		b.DamageTotalMult *= 1.10;
		b.DamageArmorMult *= 1.20;

		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.MeleeSkill += 2;
			b.Bravery += 4;
			b.Hitpoints += 3;
			::Legends.Perks.grant(this, ::Legends.Perk.Fearsome);
			if (day >= 50)
			{		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_true_believer"));				
				b.MeleeDefense += 3;
				b.MeleeSkill += 2;
				b.RangedDefense += 2;
				b.Hitpoints += 4;				

				if (day >= 100)
				{														
					b.MeleeSkill += 2;			
					b.MeleeDefense += 4;
					b.RangedDefense += 1;			
					b.Bravery += 3;
					b.Hitpoints += 3;
					b.DamageTotalMult += 0.05;
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));

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
			b.MeleeSkill     += 1.80 * scale;   // ~+13
			b.MeleeDefense   += 1.80 * scale;   // ~+13
			b.RangedSkill    += 1.80 * scale;   // ~+13
			b.RangedDefense  += 1.80 * scale;   // ~+13
			b.Bravery        += 1.80 * scale;   // ~+13
			b.Hitpoints      += 3.25 * scale;   // ~+25
		}

		// Beginner Modifiers
		if(("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
		{
			// Stats
			b.DamageTotalMult *= 0.85;
			b.RangedDefense -= 10;
			b.MeleeDefense -= 10;
			b.MeleeSkill -= 10;
			b.Hitpoints -= 25;
			b.Bravery -= 20;
		}

		// CORPSE - MUTATION STUFF
		
		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Enemy Mutation System
		// Tweaked in this case, 2 iterations of mutations, 2-4 max
		// 2 - max 4 mutations total
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Always,::TLW.EnemyMut.Melee,false);
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.Always,::TLW.EnemyMut.Melee,false);
		
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

		// vattghern visuals plus sign intensity and regen
		this.m.Skills.add(this.new("scripts/skills/traits/pov_vattghern_enemy_trait")); // vattghern

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
			// Vattghern sword
			this.m.Items.equip(this.new("scripts/items/weapons/pov_vattghern_longsword"));			
		}

		// Equipment (Armor, Helmets)
		local equipmentSets = [
			{ armor = "vattghern_armor_01", helmet = "vattghern_helmet_01" }
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

		this.getSprite("miniboss").setBrush("pov_vattghern_bust");

		//Stats Modifiers
		this.m.BaseProperties.DamageDirectMult *= 1.05;		
		return true;
	}

});

