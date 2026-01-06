this.pov_phallumbra_event <- this.inherit("scripts/events/event", {
	m = {
		OtherGuy = null
	},
	function create()
	{
		this.m.ID = "event.pov_phallumbra";
		this.m.Title = "Low Hanging Shadow";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/pov_phallumbra.png[/img]{ The fire crackles low, casting long, wavering fingers of light against the encroaching forest. You sit on a rotted log, the chill of the wild seeping into your bones, when a sudden, heavy warmth settles upon your shoulder. It is a presence both soft and intrusive, a weight that pulses with a rhythmic, spectral life.\n\nYou whip your head around, hand flying to your hilt, but the air behind you is empty. Only the pines hiss in the wind. Across the embers, the veterans look on with hollow eyes, their faces pale in the dying light.\n\n %SPEECH_ON% Phallumbra... %SPEECH_OFF%The word is a dry rasp from the back of %other%\'s throat. %They_other% makes a sign against the evil eye, staring at the spot where the shadow touched you. \"The Lurker in the Groin of Night\", %they_other% mutters, %their_other% hand trembling as %they_other% reaches for the flagon. \"An omen of a hard road ahead, Captain. A very... hard road\".}"
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Feeling Touched...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local brothers = this.World.getPlayerRoster().getAll();
                foreach( bro in brothers )
                {
                    if (this.Math.rand(1, 100) <= 50)
                    {
                        bro.worsenMood(0.5, "Witnessed the \"Phallumbra\"");

                        if (bro.getMoodState() > this.Const.MoodState.Neutral)
                        {
                            this.List.push({
                                id = 10,
                                icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                            });
                        }
                    }
                }
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local other_candidates = [];

		foreach( bro in brothers )
        {
            other_candidates.push(bro);
        }

		if (brothers.len() <= 2)
		{
			return;
		}

		if (this.World.getTime().IsDaytime)
        {
            return false;
        }

		if (this.World.getTime().Days <= 20)
		{
			return;
		}

		if (other_candidates.len() == 0)
        {
            return;
        }


		this.m.OtherGuy = other_candidates[this.Math.rand(0, other_candidates.len() - 1)];

		this.m.Score = 8;
		//this.m.Score = 9999;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
            "other",
            this.m.OtherGuy.getName()
        ]);
        ::Const.LegendMod.extendVarsWithPronouns(_vars, this.m.OtherGuy.getGender(), "other");
	}

	function onClear()
	{
		this.m.OtherGuy = null;
	}

});

