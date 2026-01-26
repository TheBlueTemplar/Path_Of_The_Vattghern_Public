::TLW.HooksMod.hook("scripts/skills/effects_world/legend_irritable_effect", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.Name = "Burnout";
		this.m.Description = "Recent, intense study has led to this character experiencing a serious burnout. They need time to digest the new information they received, and for a time, they will not be able to further study material like books or scrolls."
	}
});	
