this.pov_all_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.pov_all_intro";
		this.m.Title = "Welcome to \"Path of the Vatt\'ghern\" (PoV)";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/pov_testing_intro.png[/img]{%SPEECH_ON% Welcome to \"Path of the Vatt\'ghern\" (PoV). This is a witcher-themed mod, adding in quite a few new features, including vattgherns, items, events, skills, enemies and so on. PoV also overhauls some legends/vanilla mechanics, like fire damage, and the injury system.%SPEECH_OFF% %SPEECH_ON% Below are some simple directions and explanations, especially if you are new to PoV, or if you just want to freshen up your memory. %SPEECH_OFF%[color=" + this.Const.UI.Color.povEvent + "] • The most important parts of PoV are explained in its own ingame WIKI, located in the \"wiki\" tab of PoV mod settings. \n• Make sure to check PoV mod settings and finetune them to your preference. Recommended settings for PoV and Legends in the Wiki section. \n• If you find any bugs, make sure to post about them in PoV\'s discord server. \n• For more information, check out PoV\'s Discord server. \n• Don\'t want to see this intro event again? Disable it in PoV mod options. \n\n Have Fun ☺[/color]}"
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let\'s Go!",
					function getResult( _event )
					{
						::World.Flags.add("PovIntro");
						return 0;
					}

				}
			],
			function start( _event )
			{
				// What are you looking for...? HUH?
			}

		});
	}

	function isValid() {
		if (::TLW.EnablePovIntroEvent == false)
		{
			return false;
		}
		return !::World.Flags.has("PovIntro");
	}

	function canFire() {
		return this.isValid();
	}

});

