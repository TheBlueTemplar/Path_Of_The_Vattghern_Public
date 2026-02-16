// Things I ALWAYS want applied are done after the hasFotn check, the others are done alone

// Perks Reworks/Tweaks (replacements, less compatible) - Not applied with Fotn on

// For some perks, I do both compatible and not compatible changes (additions and overwrites)
// In that case, these perks will be edited two times, here. See LegendFieldTriage for example

if (!::TLW.hasFOTN)
{
	// Replacements (Less compatible)
	::Const.Strings.PerkDescription.LegendFieldTriage = "Spend medicine to heal a unit on the battlefield.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Unlocks the [color="+ ::Const.UI.Color.povPerkPurple + "]Field Triage[/color] skill which heals any adjacent ally by up to [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] Hitpoints, plus [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of their maxHp.\n\n• Uses [color=" + this.Const.UI.Color.NegativeValue + "]1[/color] medicine per [color=" + this.Const.UI.Color.PositiveValue + "]2 + 1%[/color] Hitpoints healed, with a limit of 10 medicine per skill use.\n\n• Costs [color=" + this.Const.UI.Color.NegativeValue + "]4[/color] AP and [color=" + this.Const.UI.Color.NegativeValue + "]16[/color] Fatigue."
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendFieldTriage].Tooltip = ::Const.Strings.PerkDescription.LegendFieldTriage;

	::Const.Strings.PerkDescription.LegendPrayerOfFaith = "A prayer of devotion grants strength to your allies and baffles the undead.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Unlocks the [color="+ ::Const.UI.Color.povPerkPurple + "]Prayer of Faith[/color] skill.\n\n• When activated adjacent allies gain [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] of your current Resolve as a bonus to Melee and Ranged Defense.\n\n• Adjacent cultists and undead are [color="+ ::Const.UI.Color.povPerkBurgundy + "]Baffled[/color].\n\n• [color="+ ::Const.UI.Color.povPerkBurgundy + "]Baffled[/color] enemies have their Melee Defense, Initiative, and Max Fatigue reduced by [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color].\n\n•  Costs [color=" + this.Const.UI.Color.NegativeValue + "]5[/color] AP and [color=" + this.Const.UI.Color.NegativeValue + "]25[/color] Fatigue.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPrayerOfFaith].Tooltip = ::Const.Strings.PerkDescription.LegendPrayerOfFaith;

	::Const.Strings.PerkDescription.LegendPrayerOfLife = "A prayer of hope and love restores wellbeing to your allies and tears at the undead.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Unlocks the [color="+ ::Const.UI.Color.povPerkPurple + "]Prayer of Hope[/color] skill.\n\n• When activated adjacent allies gain [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] of your current Resolve as Hitpoints spread out over several turns. Can not heal more than 10 Hitpoints per turn. \n\n• Inflicts a disintegrating ailment on each adjacent undead dealing damage equel to [color=" + this.Const.UI.Color.DamageValue + "]15%[/color] of your current resolve per turn, for two turns.\n\n• Does not work on cultists.\n\n• Costs [color=" + this.Const.UI.Color.NegativeValue + "]5[/color] AP and [color=" + this.Const.UI.Color.NegativeValue + "]30[/color] Fatigue.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPrayerOfLife].Tooltip = ::Const.Strings.PerkDescription.LegendPrayerOfLife;

	::Const.Strings.PerkDescription.LegendPugilist = "Hit\'em where it hurts!\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Increase [color="+ ::Const.UI.Color.povPerkPurple + "]Hand to Hand[/color] damage by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]. \n\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Kick[/color] can now be used without a free hand and will do [color=" + this.Const.UI.Color.PositiveValue + "]5-10, + 10% of current body armor[/color] Damage, with 75% effectiveness against armor. Damage capped at 600 armor.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPugilist].Tooltip = ::Const.Strings.PerkDescription.LegendPugilist;

	::Const.Strings.PerkDescription.ShieldBash = "'Knock them back!'\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• The [color="+ ::Const.UI.Color.povPerkPurple + "]Knock Back[/color] skill now inflicts [color=" + this.Const.UI.Color.PositiveValue + "]10-25[/color] Damage (90% effective against armor) and [color=" + this.Const.UI.Color.DamageValue + "]10[/color] Fatigue Damage.\n\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Buckler Bash[/color] will do [color=" + this.Const.UI.Color.PositiveValue + "]10-15[/color] damage (115% effective against armor).\n\n• Both skill\'s damage will also scale by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] of your shield\'s maximum condition with a maximum bonus of 15.\n\n• Both skills will also cost [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] less Fatigue and [color=" + this.Const.UI.Color.NegativeValue + "]1[/color] less Action Point to use.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.ShieldBash].Tooltip = ::Const.Strings.PerkDescription.ShieldBash;

	::Const.Strings.PerkDescription.SpecCrossbow = "Master crossbows and firearms, and learn where to aim best.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Skills build up [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color] less Fatigue.\n\n• An additional [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of damage inflicted with crossbows ignores armor.\n\n• Handgonnes now require [color=" + this.Const.UI.Color.NegativeValue + "]6[/color] Action Points to reload and can be fired every turn instead of every other turn.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecCrossbow].Tooltip = ::Const.Strings.PerkDescription.SpecCrossbow;

	::Const.Strings.PerkDescription.LegendSpecialistPoacher = "From small game to big bounties.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+12[/color] chance to hit while using a Wonky Bow or Short Bow.\n\n• When taking [color="+ ::Const.UI.Color.povPerkPurple + "]Bow Mastery[/color] you will also gain [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] bonus damage. \n\n• For other weapons classified as Bows, you can get a scaling percentage of these bonuses, starting from 25% and increasing gradually to 100% according to your choice in campaign generation. \n\n• The bonus will be doubled against Wolves and Hyenas.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistPoacher;

	// Additions to Perks (very compatible)
	::Const.Strings.PerkDescription.SpecCrossbow +=@"
	• The [color="+ ::Const.UI.Color.povPerkPurple + "]\"Improvised Strike\"[/color] skill costs 50% less fatigue, and does [color="+ ::Const.UI.Color.PositiveValue + "]5 - 10[/color] more damage.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecCrossbow].Tooltip = ::Const.Strings.PerkDescription.SpecCrossbow;

	::Const.Strings.PerkDescription.SpecThrowing +=@"
	• [color="+ ::Const.UI.Color.povPerkPurple + "]Melee Attacks[/color] with thrown weapons do  [color="+ ::Const.UI.Color.PositiveValue + "]15%[/color] more damage.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecThrowing].Tooltip = ::Const.Strings.PerkDescription.SpecThrowing;

	::Const.Strings.PerkDescription.LegendMedIngredients +=@"
	• Recovers lost hitpoitns [color="+ ::Const.UI.Color.PositiveValue + "]25%[/color] faster. \n\n• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color] when assigned in the gathering tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMedIngredients].Tooltip = ::Const.Strings.PerkDescription.LegendMedIngredients;

	::Const.Strings.PerkDescription.LegendMedPackages +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+15%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color] when assigned in the gathering tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMedPackages].Tooltip = ::Const.Strings.PerkDescription.LegendMedPackages;

	::Const.Strings.PerkDescription.LegendMealPreperation +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color] when assigned in the gathering tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMealPreperation].Tooltip = ::Const.Strings.PerkDescription.LegendMealPreperation;

	::Const.Strings.PerkDescription.LegendHerbcraft +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color] when assigned in the gathering tent. \n\n• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Healing[/color] when assigned in the healing tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendHerbcraft].Tooltip = ::Const.Strings.PerkDescription.LegendHerbcraft;

	::Const.Strings.PerkDescription.LegendOreHunter +=@"
	• Increases max fatigue by [color="+ ::Const.UI.Color.PositiveValue + "]5%[/color] \n\n• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color] when assigned in the gathering tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendOreHunter].Tooltip = ::Const.Strings.PerkDescription.LegendOreHunter;

	::Const.Strings.PerkDescription.LegendWoodworking +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color] when assigned in the gathering tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendWoodworking].Tooltip = ::Const.Strings.PerkDescription.LegendWoodworking;

	::Const.Strings.PerkDescription.LegendRebound +=@"
	• Increases max fatigue by [color="+ ::Const.UI.Color.PositiveValue + "]5%[/color]";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendRebound].Tooltip = ::Const.Strings.PerkDescription.LegendRebound;

	::Const.Strings.PerkDescription.LegendCampCook +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Crafting[/color] when assigned in the crafting tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendCampCook].Tooltip = ::Const.Strings.PerkDescription.LegendCampCook;

	::Const.Strings.PerkDescription.LegendAlcoholBrewing +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+15%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Crafting[/color] when assigned in the crafting tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendAlcoholBrewing].Tooltip = ::Const.Strings.PerkDescription.LegendAlcoholBrewing;

	::Const.Strings.PerkDescription.LegendSummonFalcon +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Scouting[/color] when assigned in the scouting tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSummonFalcon].Tooltip = ::Const.Strings.PerkDescription.LegendSummonFalcon;

	::Const.Strings.PerkDescription.LegendSpecBandage +=@"
	• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Healing[/color] and [color="+ ::Const.UI.Color.PositiveValue + "]+3%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Injury Treatment[/color] when assigned in the healing tent.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecBandage].Tooltip = ::Const.Strings.PerkDescription.LegendSpecBandage;

	::Const.Strings.PerkDescription.BagsAndBelts +=@"
	• Also grants [color="+ ::Const.UI.Color.PositiveValue + "]+4[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Stash[/color] size. [color="+ ::Const.UI.Color.povTooltipGray + "](re-open inventory screen for this to take effect)[/color]";
	::Const.Perks.PerkDefObjects[::Legends.Perk.BagsAndBelts].Tooltip = ::Const.Strings.PerkDescription.BagsAndBelts;

	::Const.Strings.PerkDescription.Pathfinder +=@"
	[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Additional Effect:[/u][/color]\n• Also grants [color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Travel Speed[/color] on difficult terrain of the world map.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.Pathfinder].Tooltip = ::Const.Strings.PerkDescription.Pathfinder;

	::Const.Strings.PerkDescription.LegendMinnesanger +=@"• Gain [color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color] Resolve.\n\n• Also, gain [color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Barter[/color] multiplier";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMinnesanger].Tooltip = ::Const.Strings.PerkDescription.LegendMinnesanger;

	::Const.Strings.PerkDescription.LegendSpecialistMusician +=@"
	• Also, gain [color="+ ::Const.UI.Color.PositiveValue + "]+5[/color] Ranged Defense when holding an instrument.\n\n• Gain [color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Barter[/color] multiplier";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMusician].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistMusician;

	::Const.Strings.PerkDescription.LegendThrustMaster +=@"
	• Also, gain [color="+ ::Const.UI.Color.PositiveValue + "]+5[/color] minimum damage, on ranged attacks with javelins and throwing spears";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendThrustMaster].Tooltip = ::Const.Strings.PerkDescription.LegendThrustMaster;

	::Const.Strings.PerkDescription.LegendHolyFlame +=@"
	• Also, the consecrated effect can [color="+ ::Const.UI.Color.PositiveValue + "]disrupt[/color] the unique abilities of some undead/spirit enemies.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendHolyFlame].Tooltip = ::Const.Strings.PerkDescription.LegendHolyFlame;

	::Const.Strings.PerkDescription.LegendRecuperation +=@"
	• Much less likely to get [color="+ ::Const.UI.Color.NegativeValue + "]drunk[/color], and also [color="+ ::Const.UI.Color.PositiveValue + "]immune[/color] to the effects of the following hangover.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendRecuperation].Tooltip = ::Const.Strings.PerkDescription.LegendRecuperation;

	::Const.Strings.PerkDescription.LegendSmashingShields +=@"
	• When using throwing axes, gain the [color="+ ::Const.UI.Color.povPerkPurple + "]Split Shield (Ranged)[/color] skill, an attack targeting the enemy\'s shields to break them. Always hits shielded enemies, and counts as a normal \"throw axe\" attack for others. Costs slightly more fatigue than a normal attack. Benefits from the damage bonus of this perk, but not axe mastery.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSmashingShields].Tooltip = ::Const.Strings.PerkDescription.LegendSmashingShields;

	::Const.Strings.PerkDescription.ShieldExpert +=@"
	• Additionally, damaging shield skills get [color="+ ::Const.UI.Color.PositiveValue + "]+20%[/color] damage.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.ShieldExpert].Tooltip = ::Const.Strings.PerkDescription.ShieldExpert;

	::Const.Strings.PerkDescription.LegendScholar +=@"
	• Can read an [color="+ ::Const.UI.Color.PositiveValue + "]unlimited[/color] amount of books, and the burnout lasts for only 15 days.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendScholar].Tooltip = ::Const.Strings.PerkDescription.LegendScholar;

	::Const.Strings.PerkDescription.Student +=@"
	• Upon taking this perk, the character will begin [color="+ ::Const.UI.Color.PositiveValue + "]Learning to Read[/color] (if they don\'t know already). After some days, they will be able to benefit from skill books.";
	::Const.Perks.PerkDefObjects[::Legends.Perk.Student].Tooltip = ::Const.Strings.PerkDescription.Student;
}

// Aditions (Very Compatible)
::Const.Strings.PerkDescription.LegendPotionBrewer +=@"
• [color="+ ::Const.UI.Color.povPerkBlue + "]Enables the examination of magically infused remains and corpses[/color], in the crafting menu";
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPotionBrewer].Tooltip = ::Const.Strings.PerkDescription.LegendPotionBrewer;

	// Double enter here, cause its edited above too!
::Const.Strings.PerkDescription.LegendFieldTriage +=@"

• [color="+ ::Const.UI.Color.povPerkBlue + "]Enables the dissection of non-supernatural corpses[/color], in the crafting menu";
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendFieldTriage].Tooltip = ::Const.Strings.PerkDescription.LegendFieldTriage;

::Const.Strings.PerkDescription.Adrenaline +=@"
• Cancels the [color="+ ::Const.UI.Color.povPainEffect + "]\"Severe Pain\"[/color] effect (from injuries) when used, and gives immunity to it while active";
::Const.Perks.PerkDefObjects[::Legends.Perk.Adrenaline].Tooltip = ::Const.Strings.PerkDescription.Adrenaline;

::Const.Strings.PerkDescription.LegendToolsSpares +=@"
• Can craft silver ingots from melted silver scrap (silver bowl and silverware)";
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendToolsSpares].Tooltip = ::Const.Strings.PerkDescription.LegendToolsSpares;

::Const.Strings.PerkDescription.InspiringPresence +=@"
• Reduces cooldown of the [color="+ ::Const.UI.Color.povPerkBlue + "]Raise the Banner!![/color] skill by 1 day";
::Const.Perks.PerkDefObjects[::Legends.Perk.InspiringPresence].Tooltip = ::Const.Strings.PerkDescription.InspiringPresence;

// Conditional edits
if (!::TLW.hasSSU)
{
	::Const.Strings.PerkDescription.LegendSpecialistShieldSkill +=@"
	• Damage resistance is increased to [color="+ ::Const.UI.Color.PositiveValue + "]+20%[/color] when using [color="+ ::Const.UI.Color.povPerkPurple + "]shieldwall[/color], or to [color="+ ::Const.UI.Color.PositiveValue + "]+25%[/color] when using [color="+ ::Const.UI.Color.povPerkPurple + "]fortify[/color]";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShieldSkill].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistShieldSkill;
}

// Legends Favorite Enemy Pekrs (Edited here, all togeather) (done like the additions above, compatible)
// only active without SSU, as SSU already does that
// Maybe I overengineered this idk
if (!::TLW.hasSSU && !::TLW.hasFOTN)
{
	// List of all Favoured Enemy types (for this perk)
	local enemies = [
		"Schrat", // test
		"Ghoul",
		"Hexen",
		"Alps",
		"Unhold",
		"Lindwurm",
		"Direwolf",
		"Spider",
		"Ork",
		"Goblin",
		"Vampire",
		"Skeleton",
		"Zombie",
		"Noble",
		"Bandit",
		"Barbarian",
		"Archer",
		"Swordmaster",
		"Mercenary",
		"Caravan",
		"Southerner",
		"Nomad",
		"Beasts", // this is where new shit starts
		"Occult",
		"Greenskin",
		"Undead",
		"Civilization",
		"Outlaw",
		"Swordmaster"
	];

	// preparation for new legends versions, list above merged into this one
	// LIST ALREADY INCLUDED ABOVE, KEPT THIS FOR REFERENCE!
	local enemiesNew = [
		"Beasts",
		"Occult",
		"Greenskin",
		"Undead",
		"Civilization",
		"Outlaw",
		"Swordmaster" //old, kept
	];

	// The bonus description to append
	local bonusText = "\n• When at [color=" + ::Const.UI.Color.povPerkPurple + "]15%[/color] bonus, the perk point spent for this skill is [color=" + ::Const.UI.Color.PositiveValue + "]refunded[/color]";

	// Apply the tooltip update to all enemies
	foreach (enemy in enemies)
	{
		local key = "LegendFavouredEnemy" + enemy;

		// Schizo fallback (might actually turn out to be useful :D)
		// It WAS useful after all...
		if (!(key in ::Const.Strings.PerkDescription))
		{
			// if this floods peoples logs comment it out lel
		    //::logInfo("[PoV] Tried to edit the following perk text and failed (not a fatal error): " + key);
		    continue;
		}

		::Const.Strings.PerkDescription[key] += bonusText;
		::Const.Perks.PerkDefObjects[::Legends.Perk[key]].Tooltip = ::Const.Strings.PerkDescription[key];
	}
}