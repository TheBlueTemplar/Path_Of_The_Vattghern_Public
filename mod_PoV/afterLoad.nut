/////////////////////////////////////////////////////////////////////
// 					Author: The Blue Templar 					   //
// 			Not to be used elsewhere or tampered with, 2025.       //
/////////////////////////////////////////////////////////////////////

// CURRENTLY UNUSED
// Load PoV's Optional Overhaul Bits
::mods_hookNewObjectOnce("ui/screens/menu/main_menu_screen", function(o) {
	local connect = o.connect;
	o.connect = function()
	{
		local enabled = ::TLW.Mod.ModSettings.getSetting(::TLW.OverhaulID).getValue();
		::logInfo("[PoV] Current Overhaul setting is: " + enabled);

		if (enabled){
			//::includeFiles(::IO.enumerateFiles("mod_PoV/hooks_OPTIONAL"));
			foreach (file in ::IO.enumerateFiles("mod_PoV/hooks_OPTIONAL"))
				::include(file);
			::logInfo("[PoV] Overhaul Hooks Loaded!");
		}else
		{
			::logInfo("[PoV] Overhaul Hooks NOT Loaded - Setting Disabled!");
		}
		//foreach (file in ::IO.enumerateFiles("mod_legends/afterHooks"))
			//::include(file);
		connect();
	}
});