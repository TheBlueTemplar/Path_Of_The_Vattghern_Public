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
	}
	
]);