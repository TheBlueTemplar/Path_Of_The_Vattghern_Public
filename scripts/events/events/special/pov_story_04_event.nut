this.pov_story_04_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.pov_story_04";
		this.m.Title = "While in camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/pov_vattghern_sunset.png[/img]{ After much deliberation, you realise you are finally ready to take on tougher work: the special Vatt\'ghern contracts. The trials have done their work well, forging your Vatt\'ghern into what he was meant to be: hardened by experience, focused, and prepared to face horrors that once lay beyond reach. \n\n You sense that success in these dangerous undertakings would not go unnoticed. Should you prove worthy, you may attract rare and positive attention from those who quietly watch for individuals of uncommon power. \n\n With purpose sharpened and ambition stirred, you move on, aware that the path ahead grows darker... but also richer with possibility! \n\n [color=" + this.Const.UI.Color.povEvent + "] You have now unlocked an ambition to take and successfully complete a Vatt\'ghern contract![/color]}"
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Time to take the fight to them!",
					function getResult( _event )
					{
						::World.Flags.add("GotStrongVattghern");
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
		if (::World.Flags.has("GotVattghern") && ::World.Flags.has("GotStrongVattghernEvent") && !::World.Flags.has("GotStrongVattghern"))
		{
			return true;
		}
		else 
		{
			return false;
		}
	}

	function canFire() {
		return this.isValid();
	}

});

