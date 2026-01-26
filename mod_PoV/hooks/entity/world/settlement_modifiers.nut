// Cant get this to work with modern hooks for some reason
/*::TLW.HooksMod.hook("scripts/entity/world/settlement_modifiers", function ( q )
{
	// had an error here if I sayd q.xyz <- 1.0; idk why, this now works
	q.PovMutagenPriceMult <- 1.0;
	q.PoVCorpsePriceMult <- 1.0;

	q.reset = @(__original) function()
	{
		__original();
		this.PovMutagenPriceMult = 1.0;
		this.PoVCorpsePriceMult = 1.0;
	}
});*/

// Same shit w/old hooks, for reference
// And this works for some reason
::mods_hookExactClass("entity/world/settlement_modifiers", function(o) {
	o.PovMutagenPriceMult <- 1.0;
	o.PoVCorpsePriceMult <- 1.0;

	local reset = o.reset;
	o.reset = function () {
		reset();
		this.PovMutagenPriceMult = 1.0;
		this.PoVCorpsePriceMult = 1.0;
	}
});
