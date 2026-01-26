this.pov_bandit_gunner <- this.inherit("scripts/entity/tactical/human", {
	m = {
		IsLow = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.PovBanditGunner;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.PovBanditGunner.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/military_gunner_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.PovBanditGunner);
		b.TargetAttractionMult = 1.1;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		b.IsSpecializedInCrossbows = true;
		b.Vision = 8;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_bandits");

		// Base skills/traits/perks
		::Legends.Perks.grant(this, ::Legends.Perk.Rotation);
		::Legends.Perks.grant(this, ::Legends.Perk.Recover);
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));

		// Scaling stats and skills
		// scaling points: 25,50,100,150,200
		local day = this.World.getTime().Days;
		day = this.Math.min(day, 250);	// cap of 250, currently unused
		
		if (day >= 25)
		{
			b.RangedSkill += 1;
			b.Bravery += 3;
			b.Hitpoints += 4;

			if (day >= 50)
			{		
				::Legends.Perks.grant(this, ::Legends.Perk.Bullseye);				
				b.MeleeDefense += 1;
				b.RangedSkill += 2;
				b.RangedDefense += 2;
				b.Hitpoints += 4;				

				if (day >= 100)
				{										
					b.MeleeDefense += 1;
					b.RangedSkill += 2;
					b.RangedDefense += 2;
					b.Hitpoints += 4;			
					b.Bravery += 3;
					b.DamageTotalMult += 0.05;
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_lithe"));

					if (day >= 150)
					{
						b.MeleeSkill += 2;	
						b.Initiative += 4;
						b.MeleeDefense += 1;
						b.RangedSkill += 2;
						b.RangedDefense += 3;
						b.Hitpoints += 4;			
						b.Bravery += 3;		

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
							this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));	

							if (day >= 250)
							{
								b.MeleeSkill += 4;	
								b.Initiative += 4;
								b.MeleeDefense += 2;
								b.RangedSkill += 3;
								b.RangedDefense += 3;
								b.Hitpoints += 4;			
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
			::Legends.Perks.grant(this, ::Legends.Perk.LegendBallistics);
			::Legends.Perks.grant(this, ::Legends.Perk.LegendPointBlank);
			::Legends.Perks.grant(this, ::Legends.Perk.CripplingStrikes);
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
			b.MeleeSkill     += 1.00 * scale;   // ~+7
			b.MeleeDefense   += 0.70 * scale;   // ~+5
			b.RangedSkill    += 1.40 * scale;   // ~+10
			b.RangedDefense  += 1.00 * scale;   // ~+7
			b.Bravery        += 1.40 * scale;   // ~+10
			b.Hitpoints      += 1.40 * scale;   // ~+10
		}

		// Beginner Modifiers
		if(("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
		{
			// Stats
			b.DamageTotalMult *= 0.92;
			b.RangedDefense -= 6;
			b.MeleeDefense -= 4;
			b.MeleeSkill -= 5;
			b.Hitpoints -= 10;
			b.Bravery -= 5;
		}

		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Enemy Mutation System
		::TLW.MutateEntity.mutate_entity(this.actor,::TLW.EnemyMutChance.High,::TLW.EnemyMut.Ranged,false);

		// Visuals
		if (this.Math.rand(1, 100) <= 30)
		{
			local pox = this.getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_darkeyes_01");
		}
		else
		{
			local dirt = this.getSprite("dirt");
			dirt.Visible = true;
			dirt.Alpha = this.Math.rand(150, 255);
		}

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
		this.m.Items.equip(this.new("scripts/items/weapons/pov_feuerbuchse"));
		this.m.Items.equip(this.new("scripts/items/ammo/powder_bag"));

		local r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/arming_sword"));
		}
		else if (r == 2)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/flail"));
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
			{ armor = "pov_bandit_gunner_armor", helmet = "pov_bandit_gunner_helmet" }
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

		//Named Stuff
		this.m.Items.equip(this.new("scripts/items/weapons/named/pov_named_feuerbuchse"));

		//Additional Perks
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));

		//Stats Modifiers
		local b = this.m.BaseProperties;
		b.RangedSkill += 5;
		b.RangedDefense += 5;
		b.Bravery += 15;
		b.DamageDirectMult *= 1.1;

		return true;
	}

});

