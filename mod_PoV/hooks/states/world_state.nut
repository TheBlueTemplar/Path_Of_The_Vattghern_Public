::TLW.HooksMod.hook("scripts/states/world_state", function ( q ) {
// This is only for game launch, then main menu music can be toggled in pov mod settings
	q.onShow = @(__original) function()
	{	
		__original();

		::logInfo("[PoV] Hooking world_state.onShow()...");

	    // Check and Update PoV Main Menu logo on menu load
	    local world_menu = ::MSU.Utils.getState("world_state").m.WorldMenuScreen;
	    if (::MSU.isNull(world_menu) || world_menu.m.JSHandle == null) return;
	    world_menu.m.JSHandle.asyncCall("updatePOVLogoImage", ::TLW.Mod.ModSettings.getSetting(::TLW.EnableMainMenuLogoID).getValue());

	    ::logInfo("[PoV] Hooking world_state.onShow()... DONE");
	}

});	