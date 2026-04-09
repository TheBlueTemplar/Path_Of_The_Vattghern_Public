/////////////////////////////////////////////////////////////////////
// 					Author: The Blue Templar 					   //
// 			Not to be used elsewhere or tampered with, 2025.       //
/////////////////////////////////////////////////////////////////////

::TLW.hasFOTN <- ::mods_getRegisteredMod("mod_fury_of_the_northmen") != null;

// Load FOTN shit, if exists
if (::TLW.hasFOTN){::includeFiles(::IO.enumerateFiles("mod_PoV/hooks_FOTN"));}
