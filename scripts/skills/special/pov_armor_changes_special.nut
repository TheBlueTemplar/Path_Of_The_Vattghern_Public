this.pov_armor_changes_special <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.pov_armor_changes_special";
		this.m.Name = "Armor Protection";
		this.m.Description = "Most armor is excellent at providing protection, granting increased resistances based on the armor\'s current condition (larger for the body).\n\n That resistance grows fast, but with diminishing returns the heavier the armor is. On the other hand, that means that damaging heavy armor will not reduce said resistance by much.\n\n As the heavier armors (body + head >= 200) become damaged, they also hinder their wearer, making combat harder for them. \n\n A similar effect applies to opponents (with higher positives and penalties).";
		this.m.Icon = "skills/pov_armor_global.png"; // dunno why I made an icon (cause I needed it LOL)
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.Special;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsHidden = false;
	}

	function getDescription()
	{
		return "Most armor is excellent at providing protection, granting increased resistances based on the armor\'s current condition (larger for the body).\n\n That resistance grows fast, but with diminishing returns the heavier the armor is. On the other hand, that means that damaging heavy armor will not reduce said resistance by much.\n\n As the heavier armors become damaged, they also hinder their wearer, making combat harder for them. \n\n A similar effect applies to opponents (with higher positives and penalties).";
	}

	// left this up to debug/test it via tooltip
	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}

		];

		local actor = this.getContainer().getActor();
		// Direct damage modifiers (bonuses) convert them to one decimal numbers
		local headMod = this.Math.floor((1.0 - getHeadArmorMult()) * 1000.0) / 10.0;
		local bodyMod = this.Math.floor((1.0 - getBodyArmorMult()) * 1000.0) / 10.0;
		// Damaged Armor Penalty Modifier
		local totalMod = this.Math.floor(getArmorLoss() * 1000.0) / 10.0;
		
		// Tooltip stuff
		local headMax = actor.getArmorMax(this.Const.BodyPart.Head);
	    local bodyMax = actor.getArmorMax(this.Const.BodyPart.Body);
	    local maxTotal = headMax + bodyMax;
	     // --- Total current armor (Head + Body)
	    local headCur = actor.getArmor(this.Const.BodyPart.Head);
	    local bodyCur = actor.getArmor(this.Const.BodyPart.Body);
	    local curTotal = headCur + bodyCur;
	    // How much armor has been lost (0..1)
	    local lostFrac = (maxTotal - curTotal) / maxTotal;
	    lostFrac = this.Math.minf(1.0, this.Math.maxf(0.0, lostFrac));
	    local remainFrac = 1.0 - lostFrac;	

		ret.push({
		    id = 11,
		    type = "text",
		    icon = "ui/icons/direct_damage.png",
		    text = "Damage ignoring armor reduced by [color=" + this.Const.UI.Color.PositiveValue + "]"+headMod+"[/color]% when being hit at the head, and [color=" + this.Const.UI.Color.PositiveValue + "]"+bodyMod+"[/color]% when hit at the body (Based on Current Armor of each body part)."
		});

		if (maxTotal <= 250)
		{
			ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "Currently wearing [color=" + this.Const.UI.Color.PositiveValue + "]Light Armor[/color], and as such, no [color=" + this.Const.UI.Color.PositiveValue + "]Penalties[/color] are applied as it takes damage (it will only lose the slight damage reduction it grants)."
			});
			//this.m.Name = "Armor Protection (Light)";
		}
		else if (remainFrac == 1.00)
		{
			ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "This character\'s armor is curently [color=" + this.Const.UI.Color.PositiveValue + "]Untouched[/color], providing [color=" + this.Const.UI.Color.PositiveValue + "]Maximum Protection[/color], with no penalties."
			});
			//this.m.Name = "Armor Protection (Untouched)";
		}
		else if (remainFrac >= 0.85)
		{
		    ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "This character\'s armor is in a [color=" + this.Const.UI.Color.PositiveValue + "]Good Condition[/color], with only slight wear, providing [color=" + this.Const.UI.Color.PositiveValue + "]Great Protection[/color], with no penalties."
			});
			//this.m.Name = "Armor Protection (Good)";
		}
		else if (remainFrac >= 0.70)
		{
		    ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "This character\'s armor is [color=" + this.Const.UI.Color.NegativeValue + "]Slightly Damaged[/color], decently protecting the user but, applying a small penalty of [color=" + this.Const.UI.Color.NegativeValue + "]"+totalMod+"[/color]% to defenses and fatigue costs."
			});
			//this.m.Name = "Armor Protection (Scratched)";
		}
		else if (remainFrac >= 0.50)
		{
		    ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "This character\'s armor is [color=" + this.Const.UI.Color.NegativeValue + "]Damaged[/color], still protecting the user but applying a penalty of [color=" + this.Const.UI.Color.NegativeValue + "]"+totalMod+"[/color]% to defenses and fatigue costs."
			});
			//this.m.Name = "Armor Protection (Damaged)";
		}
		else if (remainFrac >= 0.25)
		{
		    ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "This character\'s armor is [color=" + this.Const.UI.Color.NegativeValue + "]Severely Damaged[/color], somewhat protecting the user and applying a sizable penalty of [color=" + this.Const.UI.Color.NegativeValue + "]"+totalMod+"[/color]% to defenses and fatigue costs."
			});
			//this.m.Name = "Armor Protection (Heavily Damaged)";
		}
		else if (remainFrac >= 0.10)
		{
		    ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "This character\'s armor is [color=" + this.Const.UI.Color.NegativeValue + "]Barely Holding On[/color], only slightly protecting the user and applying a big penalty of [color=" + this.Const.UI.Color.NegativeValue + "]"+totalMod+"[/color]% to defenses and fatigue costs."
			});
			//this.m.Name = "Armor Protection (Collapsing)";
		}
		else
		{
		    ret.push({
			    id = 11,
			    type = "text",
			    icon = "ui/icons/armor_body.png",
			    text = "This character\'s armor is [color=" + this.Const.UI.Color.NegativeValue + "]Ruined[/color], providing no protection, and hindering the user, by applying a very large penalty of [color=" + this.Const.UI.Color.NegativeValue + "]"+totalMod+"[/color]% to defenses and fatigue costs."
			});
			//this.m.Name = "Armor Protection (Ruined)";
		}

		return ret;
	}

	function getArmorLoss()
	{
	    local actor = this.getContainer().getActor();

	    // --- Total max armor (Head + Body)
	    local headMax = actor.getArmorMax(this.Const.BodyPart.Head);
	    local bodyMax = actor.getArmorMax(this.Const.BodyPart.Body);
	    local maxTotal = headMax + bodyMax;

	    // Exclude low-armor entities (no effect magnitude)
	    if (maxTotal <= 250.0)
	    {
	        return 0.0;
	    }

	    // --- Total current armor (Head + Body)
	    local headCur = actor.getArmor(this.Const.BodyPart.Head);
	    local bodyCur = actor.getArmor(this.Const.BodyPart.Body);
	    local curTotal = headCur + bodyCur;

	    // How much armor has been lost (0..1)
	    local lostFrac = (maxTotal - curTotal) / maxTotal;
	    lostFrac = this.Math.minf(1.0, this.Math.maxf(0.0, lostFrac));

	    // Effect starts only after 15% total armor has been lost
	    local startAt = 0.15;
	    if (lostFrac < startAt)
	    {
	        return 0.0;
	    }

	    // Normalize loss into a 0..1 progress value AFTER the threshold:
	    // lostFrac = 0.20 -> progress = 0
	    // lostFrac = 1.00 -> progress = 1
	    local progress = (lostFrac - startAt) / (1.0 - startAt);
	    progress = this.Math.minf(1.0, this.Math.maxf(0.0, progress));

	    // Scale penalty with total max armor (with linear interpolation)
	    // 250 total armor -> 0.15 (0.13 for player)
	    // 1000 total armor -> 0.35 (0.30 for player)
	    local t = (maxTotal - 250.0) / (1000.0 - 250.0);
	    t = this.Math.minf(1.0, this.Math.maxf(0.0, t));

	    local maxEffect = 0.15 + (0.35 - 0.15) * t; // 0.15 .. 0.35 (min 0.05, see below)

    	// Start scaling from 5% penalty at the threshold (progress=0), up to maxEffect at full loss (progress=1)
    	local minEffect = 0.05;
    	local effect = minEffect + ((maxEffect - minEffect) * progress);

    	// --- Player-only softening (85% effect) 
    	local playerScale = actor.isPlayerControlled() ? 0.85 : 1.0; 

	    // Return the effect magnitude
	    return effect * playerScale;
	}


	function getHeadArmorMult() // Head armor: logarithmic scaling (diminishing returns)
	{
	    local actor = this.getContainer().getActor();
	    // Current head armor (after damage)
	    local armor = actor.getArmor(this.Const.BodyPart.Head);

	    // Design parameters
	    local maxReduction = 0.30;   // Maximum damage reduction (30%)
	    local capArmor    = 500.0;   // Armor value at which max reduction is reached
	    local scale       = 175.0;   // Controls how fast reduction ramps up (lower = steeper early gains)

	    /*
	        Logarithmic scaling formula:

	        reduction =
	            maxReduction
	            * log(1 + armor / scale)
	            / log(1 + capArmor / scale)

	        Properties:
	        - armor = 0        → reduction = 0
	        - armor = capArmor → reduction = maxReduction
	        - armor > capArmor → approaches maxReduction asymptotically
	        - Provides diminishing returns at higher armor values

	        Examples: (Head Armor - Reduction% Enemy, Reduction% Player)
	        50  ->	5.5%		/	4.5%
	        100 ->	10.0%		/	8%
	        150 ->	14.0%		/	12%
	        250 ->	20.0%		/	16%
	        375 ->	25.0%		/	20%
			500 ->	30.0%		/	24%
	    */
	    local reduction = maxReduction * log(1.0 + armor / scale) / log(1.0 + capArmor / scale);

	    // Safety clamp (prevents negative values or overshooting due to float precision)
	    reduction = this.Math.minf(maxReduction, this.Math.maxf(0.0, reduction));

	    // Convert reduction into final damage multiplier
	    // Example: 30% reduction → multiplier = 0.70
	    // Player gets 70% of the benefits (for 30% base reduction, get ~24% instead)
	    local playerScale = actor.isPlayerControlled() ? 0.80 : 1.0;
		
		return 1.0 - (reduction * playerScale);
	}

	function getBodyArmorMult() // Body armor: logarithmic scaling (diminishing returns)
	{
	    local actor = this.getContainer().getActor();
	    // Current head armor (after damage)
	    local armor = actor.getArmor(this.Const.BodyPart.Body);

	    // Design parameters
	    local maxReduction = 0.35;   // Maximum damage reduction (35%)
	    local capArmor    = 500.0;   // Armor value at which max reduction is reached
	    local scale       = 175.0;   // Controls how fast reduction ramps up (lower = steeper early gains)

	    /*
	        Logarithmic scaling formula:

	        reduction =
	            maxReduction
	            * log(1 + armor / scale)
	            / log(1 + capArmor / scale)

	        Properties:
	        - armor = 0        → reduction = 0
	        - armor = capArmor → reduction = maxReduction (35%)
	        - armor > capArmor → approaches maxReduction asymptotically
	        - Provides diminishing returns at higher armor values

	        Examples: (Body Armor → Reduction% Enemy, Reduction% Player)
	        50  ->  ~6.0%	/	5.0%
	        100 -> ~12.0%	/	10.0%
	        150 -> ~16.0%	/	13.0%
	        250 -> ~23.0%	/	19.0%
	        375 -> ~30.0%	/	24.0%
	        500 ->  35.0%	/	28.0%
	    */
	    local reduction =maxReduction * log(1.0 + armor / scale) / log(1.0 + capArmor / scale);

	    // Safety clamp (prevents negative values or overshooting due to float precision)
	    reduction = this.Math.minf(maxReduction, this.Math.maxf(0.0, reduction));

	    // Convert reduction into final damage multiplier
	    // Example: 35% reduction → multiplier = 0.65
	    // Player gets 80% of the benefits (for 35% base reduction, get ~28% instead)
	    local scale = actor.isPlayerControlled() ? 0.80 : 1.0;
		
		return 1.0 - (reduction * scale);
	}

	function onUpdate( _properties )
	{
		// Toggle the (visual only) appearance of this effect according to settings
		if (!::TLW.PovShowArmor)
		{
			this.m.IsHidden = true;
		}
		else
		{
			// if setting is true
			this.m.IsHidden = false;
		}	

		// Apply penalties
		local actor = this.getContainer().getActor();
		local mod = getArmorLoss();
		_properties.MeleeDefenseMult *= 1 - mod;
		_properties.RangedDefenseMult *= 1 - mod;
		_properties.FatigueEffectMult *= 1 + mod;

		// Effect's Naming and Icons
		local headMax = actor.getArmorMax(this.Const.BodyPart.Head);
	    local bodyMax = actor.getArmorMax(this.Const.BodyPart.Body);
	    local maxTotal = headMax + bodyMax;
	     // --- Total current armor (Head + Body)
	    local headCur = actor.getArmor(this.Const.BodyPart.Head);
	    local bodyCur = actor.getArmor(this.Const.BodyPart.Body);
	    local curTotal = headCur + bodyCur;
	    // How much armor has been lost (0..1)
	    local lostFrac = (maxTotal - curTotal) / maxTotal;
	    lostFrac = this.Math.minf(1.0, this.Math.maxf(0.0, lostFrac));
	    local remainFrac = 1.0 - lostFrac;	

	    // hide effect if max total is 0
	    if (maxTotal == 0)
	    {
	    	this.m.IsHidden = true;
	    }

	    if (maxTotal <= 200)
		{
			this.m.Name = "Armor Protection (Light)";
			this.m.Icon = "skills/pov_armor_global.png";
		}
		else if (remainFrac == 1.00)
		{
			this.m.Name = "Armor Protection (Untouched)";
			this.m.Icon = "skills/pov_armor_global.png";
		}
		else if (remainFrac >= 0.85)
		{
			this.m.Name = "Armor Protection (Good)";
			this.m.Icon = "skills/pov_armor_global.png";
		}
		else if (remainFrac >= 0.70)
		{
			this.m.Name = "Armor Protection (Scratched)";
			this.m.Icon = "skills/pov_armor_global.png";
		}
		else if (remainFrac >= 0.50)
		{
			this.m.Name = "Armor Protection (Damaged)";
			this.m.Icon = "skills/pov_armor_global.png";
		}
		else if (remainFrac >= 0.25)
		{
			this.m.Name = "Armor Protection (Heavily Damaged)";
			this.m.Icon = "skills/pov_armor_danger_global.png";
		}
		else if (remainFrac >= 0.10)
		{
			this.m.Name = "Armor Protection (Collapsing)";
			this.m.Icon = "skills/pov_armor_danger_global.png";
		}
		else
		{
			this.m.Name = "Armor Protection (Ruined)";
			this.m.Icon = "skills/pov_armor_ruined_global.png";
		}
	}

	/*function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{	
		local headMod = getHeadArmorMult();
		local bodyMod = getBodyArmorMult();		

		if (_hitInfo.BodyPart == this.Const.BodyPart.Head)
		{
			//hehe
			_properties.DamageReceivedDirectMult *= headMod;
		}
		else if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			//xd
			_properties.DamageReceivedDirectMult *= bodyMod;
		}
	}*/

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
	    local headMod = getHeadArmorMult();
	    local bodyMod = getBodyArmorMult();

	    local partMod = 1.0;
	    // Change modifier depending on body part hit
	    if (_hitInfo.BodyPart == this.Const.BodyPart.Head)
	    {
	        partMod = headMod;
	    }
	    else if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
	    {
	        partMod = bodyMod;
	    }

	    // If the hit is fully "direct" (ignores armor), scale TOTAL so it always applies.
	    // Exclude DOT effects, and some handpicked skills (Puncture, Nightmare, Bront, Ghost Touch (+PoV Version) + some Legends skills (magic, banshee, warden, puncture on legends daggers))
	    // Also includes checks for skills from other mods
	    if (_hitInfo.DamageDirect >= 1.0 && _skill != null && _skill.isAttack() 
	    	// Vanilla
	    	//&& _skill.getID() != "actives.puncture" // not sure about this one
	    	&& _skill.getID() != "actives.nightmare" 
	    	&& _skill.getID() != "actives.ghastly_touch" 
	    	// PoV
	    	&& _skill.getID() != "actives.pov_ghastly_touch"
	    	&& _skill.getID() != "actives.pov_bront" 
	    	// Legends
	    	&& _skill.getID() != "actives.legend_deathtouch" 
	    	&& _skill.getID() != "actives.legend_drain"
	    	//&& _skill.getID() != "actives.actives.legend_choke"
	    	&& _skill.getID() != "actives.legend_nightmare_touch"
	    	&& _skill.getID() != "actives.legend_nightmare_touch_zoc" 
	    	//&& _skill.getID() != "actives.legend_puncture_parry_dagger_skill" 
	    	&& _skill.getID() != "actives.legend_redback_puncture" 
	    	&& _skill.getID() != "actives.legend_vala_warden_pale_touch" 
	    	&& _skill.getID() != "actives.legend_vala_warden_wail"
	    	// Rotu (And SSU - same ids)
	    	&& _skill.getID() == "actives.smoke_and"
    		&& _skill.getID() == "actives.rotu_electric_skill"
    		&& _skill.getID() == "actives.rotu_chain_lightning"
    		&& _skill.getID() == "actives.ghost_phase"
    		&& _skill.getID() == "actives.ssu_ghost_spear_strike")
	    {
	    	//maybe scale partMod in this case? (better resistance vs direct)
	    	//partMod = 0.1; // test

	    	// in that case, if the right skills are used, set partMod to 1
	        _properties.DamageReceivedTotalMult *= partMod;
	    }
	    else
	    {
	        // Otherwise scale just the direct portion (or swap to Regular if that's what you want)
	        _properties.DamageReceivedDirectMult *= partMod;
	    }
	}

});
