::TLW.HooksMod.hook("scripts/states/main_menu_state", function ( q ) {
// This is only for game launch, then main menu music can be toggled in pov mod settings
	q.onShow = @(__original) function()
	{
		// POV MAIN MENU MUSIC!

		// Read the current PoV Main Menu Music setting value
	    local enabled = ::TLW.Mod.ModSettings.getSetting(::TLW.EnablePovMainMusicID).getValue();
	    ::logInfo("[PoV] Hooking main_menu_state.onShow()...");
	    ::logInfo("[PoV] Current Main Menu Music setting is: " + enabled);
	    // Apply tracks 
	    if (enabled)
	    {
	        // default vanilla onShow function, only replacement is my own music tracks
	        // This way, game automatically starts with my music, instead of its own
	        // If my setting is disabled on launch, run vanilla function (so also good compat)
	        this.Sound.stopAmbience();
			this.Music.setTrackList(this.Const.Music.PovMenuTracks, 4000);
			this.World.getPlayerRoster().clear();
			this.Cursor.setCursor(this.Const.UI.Cursor.Hand);
			local vm = this.Settings.getVideoMode();
			local animate = this.m.IsBooting && vm.Width >= 1920 && vm.Height >= 1080;
			this.m.IsBooting = false;
			this.m.MainMenuScreen.show(animate);
			this.LoadingScreen.hide();

			if (!this.m.IsShown)
			{
				this.m.IsShown = true;
			}
			else
			{
				this.storeStatistics();
			}

			::logInfo("[PoV] PoV\'s Main Menu music applied");
	    }
	    else
	    {
	    	__original();
	    	::logInfo("[PoV] Vanilla Main Menu music applied");
	    }
	}

});	