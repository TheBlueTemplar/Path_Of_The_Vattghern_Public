this.pov_mutants_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.pov_mutants_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/pov_anatomist_over_tools.png[/img]You remember the night he arrived pale, soft-spoken, with ink-stained fingers and eyes that lingered too long on scars. A traveling anatomist, he called himself. A seeker of truths hidden beneath skin and bone. He stayed for weeks. Your kind are used to stares, to torches and whispers. But he did not flinch. He asked questions. Measured. Took notes. And when the villagers finally demanded you leave, he packed his instruments without protest. %SPEECH_ON% We are not so different...You seek a place in this world. I seek to understand it.%SPEECH_OFF% So you left together. Now you stand at the head of the [color=" + this.Const.UI.Color.povEvent + "]%companyname%[/color] - one curious anatomist and two so-called mutants, bound not by fear, but by choice. He hungers for knowledge: strange blood, resilient flesh, the secrets of transformation. You hunger for coin… and perhaps a life not lived in hiding. \n\n If the world calls you monsters, then you will become something else entirely — a company. A brotherhood. An experiment in survival. The anatomist adjusts his spectacles. Your companion flexes clawed fingers. There is much to learn.",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Hoozah!!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The " + this.World.Assets.getName();
	}

	function onClear()
	{
	}

});

