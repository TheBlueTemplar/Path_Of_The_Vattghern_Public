::TLW.HooksMod.hook("scripts/states/tactical_state", function ( q ) {
// This is only for game launch, then main menu music can be toggled in pov mod settings
	q.onShow = @(__original) function()
	{	
		__original();
		
		::logInfo("[PoV] Hooking tactical_state.onShow()...");

	    // Check and Update PoV Main Menu logo on menu load
	    local tactical_menu = ::MSU.Utils.getState("tactical_state").m.TacticalMenuScreen;
	    if (::MSU.isNull(tactical_menu) || tactical_menu.m.JSHandle == null) return;
	    tactical_menu.m.JSHandle.asyncCall("updatePOVLogoImage", ::TLW.Mod.ModSettings.getSetting(::TLW.EnableMainMenuLogoID).getValue());

	    ::logInfo("[PoV] Hooking tactical_state.onShow()... DONE");
	}

});	