this.pov_donkeys_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.pov_donkeys_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/pov_new_company_intro.png[/img]You rise before dawn, the smell of hay still clinging to your clothes. For years you owned a quiet stable, tending beasts and listening to travelers boast of fortunes made on the road. At last, you grew tired of brushing other men\'s saddles while they chased glory.\n\n So you sold it all. \n\n The paddocks are empty, the sign torn down. In their place stands a rickety wagon piled high with goods, and beside it, your three stubborn, long-eared donkeys. They\'ve hauled grain, drunks, and worse without complaint. They will haul your ambition just the same. You are now the leader of the [color=" + this.Const.UI.Color.povEvent + "]%companyname%[/color]. An eccentric merchant with more nerve than sense, and beasts too stubborn to quit. \n\n The roads are dangerous. Bandits stalk trade routes, monsters roam the wilds, and war leaves plenty behind to scavenge. But where others see risk, you see profit. Your donkeys bray impatiently. \n\n Time to trade hay for crown.. and see who laughs last!",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "HREEEEE-AAAW!",
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

