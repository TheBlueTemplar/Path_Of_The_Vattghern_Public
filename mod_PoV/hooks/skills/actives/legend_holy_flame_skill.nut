::TLW.HooksMod.hook("scripts/skills/actives/legend_holyflame_skill", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.Description += "\n\n Also disrupts the effects of some ghost type enemies";
	}
});	

// Obligatory yolo mode skibidi hook