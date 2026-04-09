/**
 * This file contains definitions and helper function for perks used in Legends.
 *
 * To add new perk, add definition to perkDefObjects:
 * perkDefObjects.push({
 *		ID = "perk.legend_ballistics", 									<- by convention, use legend_ prefix for your perk name or use your own if that's submod
 *		Script = "scripts/skills/perks/perk_legend_ballistics", 		<- same here
 *		Name = ::Const.Strings.PerkName.LegendBallistics,   			<- Name and Tooltip should be defined in perk_strings.nut
 *		Tooltip = ::Const.Strings.PerkDescription.LegendBallistics,
 *		Icon = "ui/perks/ballistics56_circle.png",						<- provide both icons, that will be used on perk screen, here's perk granted version
 *		IconDisabled = "ui/perks/ballistics56_circle_bw.png",			<- perk not granted version
 *		Const = "LegendBallistics" 										<- constant name this definition will be available at ::Const.Perks.PerkDefs, by convention, use Legend prefix for your perk or use your own if that's submod
 *	});
 *
 *	In perk implementation create() method it's encouraged to use helper function to set defined fields automatically by using
 *  ::Const.Perks.setup(this.m, ::Legends.Perk.LegendBallistics);
 *  Use your name, this will ensure there's not mismatch or typos in ID, Icons etc.
 *  If your perk is an effect or requires to show different icons when used as a skill or whatever other reason, you can still set values you need regardless what helper sets.
 *
 * 	If you need to reference perk in other place, it's best to use reference to the ID instead of raw string literal.
 *  For example, instead of using:
 *  	bro.getSkills().hasSkill("perk.legend_ballistics")
 *  Use:
 *  	bro.getSkills().hasPerk(::Legends.Perk.LegendBallistics)
 */

// Vatt'ghern
::Const.Strings.PerkName.PovSignsOffense <- "Vatt\'ghern Signs: Offense";
::Const.Strings.PerkDescription.PovSignsOffense <- "Specialised in offensive signs, meant to inflict maximum harm on the opponent\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Igni\" Sign[/color], which enables a sweeping, burning melee attack.\n\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Bront\" Sign[/color], which enables an arching, electric ranged attack.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] sign intensity.";

::Const.Strings.PerkName.PovSignsDefense <- "Vatt\'ghern Signs: Defense";
::Const.Strings.PerkDescription.PovSignsDefense <- "Specialised in defensive signs, meant to the vatt\'ghern alive and standing.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Quen\" Sign[/color], which creates a shield that reflects damage.\n\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Yrden\" Sign[/color], traps an area, disturbing enemie\'s abilities.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] sign intensity.";

::Const.Strings.PerkName.PovSignsControl <- "Vatt\'ghern Signs: Control";
::Const.Strings.PerkDescription.PovSignsControl <- "Specialised signs meant to control the flow of combat, stunning and displacing opponents.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Aard\" Sign[/color], which creates a large aoe shockwave, slightly damaging and pushing enemies behind, with a chance to stagger them.\n\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Axii\" Sign[/color], which can baffle, daze and stun an opponent.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] sign intensity.";

::Const.Strings.PerkName.PovSignMastery <- "Vatt\'ghern Sign Mastery";
::Const.Strings.PerkDescription.PovSignMastery <- "Vatt\'ghern may not be wizards, but they can get damn close to it...\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] sign intensity. \n\n• Casting signs costs [color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] AP, and [color=" + this.Const.UI.Color.PositiveValue + "]-25%[/color] fatigue. \n\n• Sign casting cooldown is now [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] turn instead of 2.";

::Const.Strings.PerkName.PovChampionSlayer <- "Champion Slayer";
::Const.Strings.PerkDescription.PovChampionSlayer <- "Vatt\'ghern are not created to defeat weaklings, or even normal foes. They are meant for the enemies that would give the common man pause.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] Attack, Damage, and Sign Intensity against Champions. \n\n• Grants [color="+ ::Const.UI.Color.PositiveValue + "]+20%[/color] [color="+ ::Const.UI.Color.povPerkOrange + "]Training[/color] when assigned in the training tent.";

::Const.Strings.PerkName.PovStabilizedMutations <- "Stabilized Mutations";
::Const.Strings.PerkDescription.PovStabilizedMutations <- "\"More...I want more...\".\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Able to make use of [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] more Mutagen (indirectly allowing for increased scaling of the Vatt\'ghern trait). \n\n• Mutation aftermath will last for [color="+ ::Const.UI.Color.PositiveValue + "]-3[/color] less days. \n\n• Instantly gain a [color="+ ::Const.UI.Color.PositiveValue + "]Veteran Levelup[/color].";


// Specialist Perks
::Const.Strings.PerkName.PovSpecialistButcher <- "Slaughterman";
::Const.Strings.PerkDescription.PovSpecialistButcher <- @"
A brutal expert in carving flesh, now striking where armor fails and leaving wounds that refuse to close.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit, [color=%positive%]+10%[/color] damage ignoring armor and [color=%positive%]+2[/color] Bleed damage while using a Butcher's Cleaver, or a saw.

• When taking [color=%perk%]Cleaver Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• For other weapons classified as Cleavers, but not Whips, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistBlacksmith <- "Ironbreaker";
::Const.Strings.PerkDescription.PovSpecialistBlacksmith <- @"
A master of hammer and anvil, breaking armor apart with the same skill used to forge it.

[color=%passive%][u]Passive:[/u][/color]
• While using a Blacksmith's Hammer gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]+20%[/color] effectiveness vs armor.

• When taking [color=%perk%]Hammer Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• Grants [color=%positive%]+5%[/color] [color=%skill%]Repairing[/color] and [color=%skill%]Scavenging[/color] in camp.

• For other weapons classified as One Handed Hammers, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistPrisoner <- "Cutthroat";
::Const.Strings.PerkDescription.PovSpecialistPrisoner <- @"
A lurking predator, finding the smallest openings to drive steel where armor offers no protection.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]+20%[/color] damage ignoring armor while using any Knife.

• When taking [color=%perk%]Dagger Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• Gain [color=%positive%]+5[/color] Melee and Ranged defense while hidden.

• For other weapons classified as Daggers, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistMilitia <- "Phalanx";
::Const.Strings.PerkDescription.PovSpecialistMilitia <- @"
A disciplined fighter trained to hold the line, striking swiftly at any who dare close the distance.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]15%[/color] Melee Damage on Attacks of Opportunity while using a Militia Spear, Wooden Spear and Ancient spear.

• When taking [color=%perk%]Spear Mastery[/color] you will also gain [color=%positive%]8%[/color] bonus damage.

• Grants [color=%positive%]+10%[/color] [color=%skill%]Training[/color] while in camp.

• For other weapons classified as Spears, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistMiner <- "Stonebreaker";
::Const.Strings.PerkDescription.PovSpecialistMiner <- @"
Trained to shatter stone and armor alike, striking with force that few defenses can withstand.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and always do at least [color=%positive%]10[/color] damage while using a Pickaxe or Military Pick.

• When taking [color=%perk%]Hammer Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• For other weapons classified as Two Handed Hammers, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.

• The bonus will be doubled against Ifrits and Rock Unholds.
";

::Const.Strings.PerkName.PovSpecialistFarmhand <- "Haymaker";
::Const.Strings.PerkDescription.PovSpecialistFarmhand <- @"
A worker of the fields turned killer, wielding long tools to reap both harvest and heads alike.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]+20%[/color] Armor Damage and [color=%positive%]+5%[/color] Chance to hit the head while using a Pitchfork, Wooden Pitchfork, Hoe or Scythe.

• When taking [color=%perk%]Polearm Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• Grants [color=%positive%]+1%[/color] movespeed at [color=%skill%]farmlands[/color] when in the world map.

• For other weapons classified as Polearms, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";


::Const.Strings.PerkName.PovSpecialistPoacher <- "Game Hunter";
::Const.Strings.PerkDescription.PovSpecialistPoacher <- @"
ALiving off forbidden kills, striking true and finishing beasts before they can flee.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]+10[/color] minimum damage while using a Wonky Bow , Short Bow or goblin bow.

• When taking [color=%perk%]Bow Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• Grants [color=%positive%]+5%[/color] [color=%skill%]Hunting[/color] while in camp.

• For other weapons classified as Bows, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.

• The bonus will be doubled against Wolves and Hyenas.
";

::Const.Strings.PerkName.PovSpecialistGravedigger <- "Corpsewarden";
::Const.Strings.PerkDescription.PovSpecialistGravedigger <- @"
Used to burying the dead, now thrives among them, growing stronger as bodies pile up.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+12[/color] chance to hit while using a Shovel.

• When taking [color=%perk%]Mace Mastery[/color] you will also gain [color=%positive%]12%[/color] bonus damage.

• For other weapons classified as Two Handed Mace, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.

• If you are using a Shovel you will also receive the Knock Out skill.

• While using a Two Handed Mace, you will also receive the Gravedigging effect, which provides bonuses to Initiative, Damage and Resolve based on the amount of corpses on the battlefield.
";

::Const.Strings.PerkName.PovSpecialistWoodsman <- "Woodsman";
::Const.Strings.PerkDescription.PovSpecialistWoodsman <- @"
Timbeeeer!

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit while using a Woodcutter's Axe or Handsaw.

• When taking [color=%perk%]Axe Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• For non-specialist weapons classified as Two Handed Axes, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.

• Allows this character to harvest wood while gathering in camp.

• The bonus will be doubled against Schrats.
";

::Const.Strings.PerkName.PovSpecialistHerbalist <- "Harvester";
::Const.Strings.PerkDescription.PovSpecialistHerbalist <- @"
Used to gathering the yield of the land, now reaps the wounded with precise and merciless cuts.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]30%[/color] of lowered threshold to inflict injuries as additional damage to hitpoints while using a Sickle or a goblin notched blade.

• When taking [color=%perk%]Sword Mastery[/color] you will also gain [color=%positive%]12%[/color] bonus damage. Additionally reduces the Action Point cost of [color=%skill%]Slash[/color] by [color=%negative%]1[/color] when using a Sickle.

• Grants [color=%positive%]+5%[/color] [color=%skill%]Gathering[/color] while in camp.

• For other weapons classified as One Handed Swords, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistShepherd <- "Skirmisher";
::Const.Strings.PerkDescription.PovSpecialistShepherd <- @"
Fights at range with speed and awareness, pelting enemies and exploiting weaknesses in their defenses.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]20%[/color] additional armor damage when using a Sling , Slingshot or Sturdy Sling.

• When taking [color=%perk%]Sling Mastery[/color] you will also gain [color=%positive%]10%[/color] bonus damage.

• Grants [color=%positive%]+5%[/color] [color=%skill%]Scouting[/color] while in camp.

• For other weapons classified as Slings, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistCultist <- "Tormentor";
::Const.Strings.PerkDescription.PovSpecialistCultist <- @"
A ruthless wielder of lash and chain, striking past defenses to deliver pain where it hurts most.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]+10%[/color] Chance to hit the head, effectiveness against armor and [color=%positive%]+5%[/color] damage ignoring armor while using Cat o nine tails or wooden flail.

• When taking [color=%perk%]Flail Mastery[/color] or [color=%positive%]Cleaver Mastery[/color] you will also gain [color=%positive%]12%[/color] bonus damage.

• For other weapons classified as Flails or Whips, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistReaper <- "Reaper";
::Const.Strings.PerkDescription.PovSpecialistReaper <- @"
Once used to harvest the fields, now swings with practiced ease to cut down the living.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+15[/color] chance to hit while using a Scythe or Warscythe.

• Also gain [color=%positive%]+25%[/color] effectiveness against armor and [color=%positive%]+10%[/color] armor penetration while using a Scythe or Warscythe.

• Reduce resolve of nearby opponents by [color=%negative%]5[/color].

• When taking [color=%perk%]Polearm Mastery[/color] or [color=%perk%]Cleaver Mastery[/color] you will also gain [color=%positive%]15%[/color] bonus damage.
";

::Const.Strings.PerkName.PovSpecialistSelfdefense <- "Stick Fighting";
::Const.Strings.PerkDescription.PovSpecialistSelfdefense <- @"
Twist and thrust with your staff to deflect blows and intercept strikes.

[color=%passive%][u]Passive:[/u][/color]
• Gain [color=%positive%]+16[/color] Melee Skill and [color=%positive%]+16[/color] Defense while wielding a staves or magic staves.

• When wielding slingstaves, musical instruments and other hybrid staves the bonus is only [color=%positive%]+8[/color].
";

::Const.Strings.PerkName.PovSpecialistInventor <- "Bombardier";
::Const.Strings.PerkDescription.PovSpecialistInventor <- @"
A trained wielder of crude gunpowder weapons, striking with thunderous force and deadly precision.

[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit while using a Firearm.

• Reduce AP cost for Handgonne [color=%skill%]Reload[/color] by [color=%negative%]1[/color] and [color=%positive%]10%[/color] bonus damage when taking [color=%perk%]Crossbow Mastery[/color].

• Gain [color=%positive%]+10[/color] chance to hit while using a Firelance.

• When taking [color=%perk%]Spear Mastery[/color] you will also gain [color=%positive%]14%[/color] bonus damage.

• For other weapons classified as Firearms, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistBodyguard <- "Reaver";
::Const.Strings.PerkDescription.PovSpecialistBodyguard <- @"
One must have some guts to apprach a big raging dude with an even bigger sword.

[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit, [color=%positive%]10%[/color] damage for all Melee area of effect attacks and [color=%positive%]15%[/color] damage when [color=%status%]Riposting[/color] when using a Longsword.

• When taking [color=%perk%]Sword Mastery[/color] gain [color=%positive%]8%[/color] damage.

• For other weapons classified as a Two-Handed Sword, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistInquisition <- "Hexenjäger";
::Const.Strings.PerkDescription.PovSpecialistInquisition <- @"
A hardened hunter of the unnatural, striking down witches and spirits with steady aim and an unbreakable will.

[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
• Gain [color=%positive%]+8[/color] chance to hit while using Wooden Stakes, Hand Crossbows or Spiked Impaler.

• Gain [color=%positive%]+10[/color] chance to hit while using a Wooden Stake.

• When taking [color=%perk%]Crossbow Mastery[/color] gain [color=%positive%]10%[/color] damage.

• [color=%positive%]+5[/color] Resolve at morale checks against fear, panic or mind control effects.

• For other weapons classified as Crossbows, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.

• While using Crossbows the bonus will be doubled against Hexe and Alps.
";

::Const.Strings.PerkName.PovSpecialistClub <- "Enforcer";
::Const.Strings.PerkDescription.PovSpecialistClub <- @"
A rough fighter who batters opponents into exhaustion, breaking their strength with relentless blows.

[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]+5[/color] fatigue per hit while using a Wooden Stick or Bludgeon.

• When taking [color=%perk%]Mace Mastery[/color] gain [color=%positive%]14%[/color] damage.

• For other weapons classified as One-Handed Mace, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistRaider <- "Skullsplitter";
::Const.Strings.PerkDescription.PovSpecialistRaider <- @"
Trained to aim for the head, delivering deadly blows that few can survive.

[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
• Gain [color=%positive%]+10[/color] chance to hit and [color=%positive%]+15%[/color] damage when hitting the head, while using a Hatchet, Crude Axe or Throwing Axe.

• When taking [color=%perk%]Axe Mastery[/color] or [color=%perk%]Throwing Mastery[/color] gain [color=%positive%]10%[/color] damage.

• For other weapons classified as One-Handed Axes, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

::Const.Strings.PerkName.PovSpecialistSpearfisher <- "Fowler";
::Const.Strings.PerkDescription.PovSpecialistSpearfisher <- @"
Throwing a spear and throwing a net is just muscle memory at this point.

[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
• Gain [color=%positive%]+12[/color] chance to hit and [color=%positive%]+6[/color] maximum damage while using Javelins.

• When taking [color=%perk%]Throwing Specialization[/color] gain [color=%positive%]10%[/color] damage.

• Each time you use a throwing weapon, you can use [color=%skill%]Throw Net[/color] for free.

• For other weapons classified as Throwing, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.
";

// not using this one for now
::Const.Strings.PerkName.PovSpecialistSharpshooter <- "Sharpshooter";
::Const.Strings.PerkDescription.PovSpecialistSharpshooter <- @"
Hitting a mark at distance is second nature, with shots that rarely miss their target.

[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
• Gain [color=%positive%]+12[/color] chance to hit and [color=%positive%]1[/color] additional range while using a Warbow.

• When taking [color=%perk%]Bow Mastery[/color] gain [color=%positive%]10%[/color] damage.

• For other weapons classified as Longbows, get a percentage of these bonuses, starting from 10% and increasing up to 50% according to the character's level, up to level 10.

• The additional range gained is still subject to vision penalties.
";


::Const.Perks.addPerkDefObjects([
	// Vatt'ghern

	{
		ID = "perk.pov_sign_offense",
		Script = "scripts/skills/perks/pov_sign_offense_perk",
		Name = this.Const.Strings.PerkName.PovSignsOffense,
		Tooltip = this.Const.Strings.PerkDescription.PovSignsOffense,
		Icon = "ui/perks/pov_sign_offense.png",
		IconDisabled = "ui/perks/pov_sign_offense_sw.png",
		Const = "PovSignsOffense"
	},
	{
		ID = "perk.pov_sign_defense",
		Script = "scripts/skills/perks/pov_sign_defense_perk",
		Name = this.Const.Strings.PerkName.PovSignsDefense,
		Tooltip = this.Const.Strings.PerkDescription.PovSignsDefense,
		Icon = "ui/perks/pov_sign_defense.png",
		IconDisabled = "ui/perks/pov_sign_defense_sw.png",
		Const = "PovSignsDefense"
	},
	{
		ID = "perk.pov_sign_control",
		Script = "scripts/skills/perks/pov_sign_control_perk",
		Name = this.Const.Strings.PerkName.PovSignsControl,
		Tooltip = this.Const.Strings.PerkDescription.PovSignsControl,
		Icon = "ui/perks/pov_sign_control.png",
		IconDisabled = "ui/perks/pov_sign_control_sw.png",
		Const = "PovSignsControl"
	},
	{
		ID = "perk.pov_sign_mastery",
		Script = "scripts/skills/perks/pov_sign_mastery_perk",
		Name = this.Const.Strings.PerkName.PovSignMastery,
		Tooltip = this.Const.Strings.PerkDescription.PovSignMastery,
		Icon = "ui/perks/pov_sign_mastery.png", // PLACEHOLDERZ
		IconDisabled = "ui/perks/pov_sign_mastery_sw.png",
		Const = "PovSignMastery"
	},
	{
		ID = "perk.pov_champion_slayer",
		Script = "scripts/skills/perks/pov_champion_slayer_perk",
		Name = this.Const.Strings.PerkName.PovChampionSlayer,
		Tooltip = this.Const.Strings.PerkDescription.PovChampionSlayer,
		Icon = "ui/perks/pov_champion_slayer.png",
		IconDisabled = "ui/perks/pov_champion_slayer_sw.png",
		Const = "PovChampionSlayer"
	},
	{
		ID = "perk.pov_stabilized_mutations",
		Script = "scripts/skills/perks/pov_stabilized_mutations_perk",
		Name = this.Const.Strings.PerkName.PovStabilizedMutations,
		Tooltip = this.Const.Strings.PerkDescription.PovStabilizedMutations,
		Icon = "ui/perks/pov_stabilized_mutations.png",
		IconDisabled = "ui/perks/pov_stabilized_mutations_sw.png",
		Const = "PovStabilizedMutations"
	},

	// Specialist

	{
		ID = "perk.pov_specialist_cultist",
		Script = "scripts/skills/perks/pov_specialist_cultist_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistCultist,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistCultist,
		Icon = "ui/perks/pov_perk_spec_cultist.png",
		IconDisabled = "ui/perks/pov_perk_spec_cultist_bw.png",
		Const = "PovSpecialistCultist"
	},
	{
		ID = "perk.pov_specialist_butcher",
		Script = "scripts/skills/perks/pov_specialist_butcher_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistButcher,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistButcher,
		Icon = "ui/perks/pov_perk_spec_butcher.png",
		IconDisabled = "ui/perks/pov_perk_spec_butcher_bw.png",
		Const = "PovSpecialistButcher"
	},
	{
		ID = "perk.pov_specialist_blacksmith",
		Script = "scripts/skills/perks/pov_specialist_blacksmith_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistBlacksmith,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistBlacksmith,
		Icon = "ui/perks/pov_perk_spec_smith.png",
		IconDisabled = "ui/perks/pov_perk_spec_smith_bw.png",
		Const = "PovSpecialistBlacksmith"
	},
	{
		ID = "perk.pov_specialist_knife_prisoner",
		Script = "scripts/skills/perks/pov_specialist_prisoner_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistPrisoner,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistPrisoner,
		Icon = "ui/perks/pov_perk_spec_dagger.png",
		IconDisabled = "ui/perks/pov_perk_spec_dagger_bw.png",
		Const = "PovSpecialistPrisoner"
	},
	{
		ID = "perk.pov_specialist_militia",
		Script = "scripts/skills/perks/pov_specialist_militia_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistMilitia,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistMilitia,
		Icon = "ui/perks/pov_perk_spec_militia.png",
		IconDisabled = "ui/perks/pov_perk_spec_militia_bw.png",
		Const = "PovSpecialistMilitia"
	},
	{
		ID = "perk.pov_specialist_miner",
		Script = "scripts/skills/perks/pov_specialist_miner_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistMiner,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistMiner,
		Icon = "ui/perks/pov_perk_spec_pickaxe.png",
		IconDisabled = "ui/perks/pov_perk_spec_pickaxe_bw.png",
		Const = "PovSpecialistMiner"
	},
	{
		ID = "perk.pov_specialist_farmhand",
		Script = "scripts/skills/perks/pov_specialist_farmhand_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistFarmhand,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistFarmhand,
		Icon = "ui/perks/pov_perk_spec_bitchfork.png",
		IconDisabled = "ui/perks/pov_perk_spec_bitchfork_bw.png",
		Const = "PovSpecialistFarmhand"
	},
	{
		ID = "perk.pov_specialist_reaper",
		Script = "scripts/skills/perks/pov_specialist_reaper_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistReaper,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistReaper,
		Icon = "ui/perks/pov_perk_spec_scythe.png",
		IconDisabled = "ui/perks/pov_perk_spec_scythe_bw.png",
		Const = "PovSpecialistReaper"
	},
	{
		ID = "perk.pov_specialist_poacher",
		Script = "scripts/skills/perks/pov_specialist_poacher_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistPoacher,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistPoacher,
		Icon = "ui/perks/pov_perk_spec_shortbow.png",
		IconDisabled = "ui/perks/pov_perk_spec_shortbow_bw.png",
		Const = "PovSpecialistPoacher"
	},
	{
		ID = "perk.pov_specialist_gravedigger",
		Script = "scripts/skills/perks/pov_specialist_gravedigger_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistGravedigger,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistGravedigger,
		Icon = "ui/perks/pov_perk_spec_shovel.png",
		IconDisabled = "ui/perks/pov_perk_spec_shovel_bw.png",
		Const = "PovSpecialistGravedigger"
	},
	{
		ID = "perk.pov_specialist_woodsman",
		Script = "scripts/skills/perks/pov_specialist_woodsman_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistWoodsman,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistWoodsman,
		Icon = "ui/perks/pov_perk_spec_woodsman.png",
		IconDisabled = "ui/perks/pov_perk_spec_woodsman_bw.png",
		Const = "PovSpecialistWoodsman"
	},
	{
		ID = "perk.pov_specialist_selfdefense",
		Script = "scripts/skills/perks/pov_specialist_selfdefense_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistSelfdefense,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistSelfdefense,
		Icon = "ui/perks/pov_perk_spec_staff.png",
		IconDisabled = "ui/perks/pov_perk_spec_staff_bw.png",
		Const = "PovSpecialistSelfdefense"
	},
	{
		ID = "perk.pov_specialist_herbalist",
		Script = "scripts/skills/perks/pov_specialist_herbalist_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistHerbalist,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistHerbalist,
		Icon = "ui/perks/pov_perk_spec_sickle.png",
		IconDisabled = "ui/perks/pov_perk_spec_sickle_bw.png",
		Const = "PovSpecialistHerbalist"
	},
	{
		ID = "perk.pov_specialist_shepherd",
		Script = "scripts/skills/perks/pov_specialist_shepherd_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistShepherd,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistShepherd,
		Icon = "ui/perks/pov_perk_spec_sling.png",
		IconDisabled = "ui/perks/pov_perk_spec_sling_bw.png",
		Const = "PovSpecialistShepherd"
	},
	{
		ID = "perk.pov_specialist_inventor",
		Script = "scripts/skills/perks/pov_specialist_inventor_perk",
		Name = this.Const.Strings.PerkName.PovSpecialistInventor,
		Tooltip = this.Const.Strings.PerkDescription.PovSpecialistInventor,
		Icon = "ui/perks/pov_perk_spec_firearm.png",
		IconDisabled = "ui/perks/pov_perk_spec_firearm_bw.png",
		Const = "PovSpecialistInventor"
	},
	{
		ID = "perk.pov_specialist_bodyguard",
		Script = "scripts/skills/perks/pov_specialist_bodyguard_perk",
		Name = this.Const.Strings.PerkName.PovSpecialistBodyguard,
		Tooltip = this.Const.Strings.PerkDescription.PovSpecialistBodyguard,
		Icon = "ui/perks/pov_perk_spec_2hsword.png",
		IconDisabled = "ui/perks/pov_perk_spec_2hsword_bw.png",
		Const = "PovSpecialistBodyguard"
	},
	{
		ID = "perk.pov_specialist_inquisition",
		Script = "scripts/skills/perks/pov_specialist_inquisition_perk",
		Name = this.Const.Strings.PerkName.PovSpecialistInquisition,
		Tooltip = this.Const.Strings.PerkDescription.PovSpecialistInquisition,
		Icon = "ui/perks/pov_perk_spec_xbow.png",
		IconDisabled = "ui/perks/pov_perk_spec_xbow_bw.png",
		Const = "PovSpecialistInquisition"
	},
	{
		ID = "perk.pov_specialist_club",
		Script = "scripts/skills/perks/pov_specialist_club_perk",
		Name = this.Const.Strings.PerkName.PovSpecialistClub,
		Tooltip = this.Const.Strings.PerkDescription.PovSpecialistClub,
		Icon = "ui/perks/pov_perk_spec_mace.png",
		IconDisabled = "ui/perks/pov_perk_spec_mace_bw.png",
		Const = "PovSpecialistClub"
	},
	{
		ID = "perk.pov_specialist_sharpshooter",
		Script = "scripts/skills/perks/pov_specialist_sharpshooter_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistSharpshooter,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistSharpshooter,
		Icon = "ui/perks/pov_perk_spec_longbow.png",
		IconDisabled = "ui/perks/pov_perk_spec_longbow_bw.png",
		Const = "PovSpecialistSharpshooter"
	},
	{
		ID = "perk.pov_specialist_raider",
		Script = "scripts/skills/perks/pov_specialist_raider_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistRaider,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistRaider,
		Icon = "ui/perks/pov_perk_spec_raider.png",
		IconDisabled = "ui/perks/pov_perk_spec_raider_bw.png",
		Const = "PovSpecialistRaider"
	},
	{
		ID = "perk.pov_specialist_spearfisher",
		Script = "scripts/skills/perks/pov_specialist_spearfisher_perk",
		Name = ::Const.Strings.PerkName.PovSpecialistSpearfisher,
		Tooltip = ::Const.Strings.PerkDescription.PovSpecialistSpearfisher,
		Icon = "ui/perks/pov_perk_spec_javelin.png",
		IconDisabled = "ui/perks/pov_perk_spec_javelin_bw.png",
		Const = "PovSpecialistSpearfisher"
	}
	
]);