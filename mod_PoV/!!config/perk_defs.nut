// Vatt'ghern
::Const.Strings.PerkName.PovSignsOffense <- "Vatt\'ghern Signs: Offense";
::Const.Strings.PerkDescription.PovSignsOffense <- "Specialised in offensive signs, meant to inflict maximum harm on the opponent\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Igni\" Sign[/color], which enables a sweeping, burning melee attack.\n\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Bront\" Sign[/color], which enables an arching, electric ranged attack.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] sign intensity.";

::Const.Strings.PerkName.PovSignsDefense <- "Vatt\'ghern Signs: Defense";
::Const.Strings.PerkDescription.PovSignsDefense <- "Specialised in defensive signs, meant to the vatt\'ghern alive and standing.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Quen\" Sign[/color], which creates a shield that reflects damage.\n\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Yrden\" Sign[/color], traps an area, disturbing enemie\'s abilities.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] sign intensity.";

::Const.Strings.PerkName.PovSignsControl <- "Vatt\'ghern Signs: Defense";
::Const.Strings.PerkDescription.PovSignsControl <- "Specialised signs meant to control the flow of combat, stunning and displacing opponents.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Aard\" Sign[/color], which creates a large aoe shockwave, slightly damaging and pushing enemies behind, with a chance to stagger them.\n\n• Gain the [color=" + this.Const.UI.Color.povPerkPurple + "]\"Axii\" Sign[/color], which can baffle, daze and stun an opponent.\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] sign intensity.";

::Const.Strings.PerkName.PovSignMastery <- "Vatt\'ghern Sign Mastery";
::Const.Strings.PerkDescription.PovSignMastery <- "Vatt\'gherns may not be wizards, but they can get damn close to it...\n\n[color=" + this.Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] sign intensity. \n\n• Casting signs costs [color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] AP, and [color=" + this.Const.UI.Color.PositiveValue + "]-25%[/color] fatigue. \n\n• Sign casting cooldown is now [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] turn instead of 2.";



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
	}
	
]);