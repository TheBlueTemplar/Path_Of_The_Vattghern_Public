::TLW.HooksMod.hook("scripts/skills/actives/legend_line_them_up_skill", function ( q ) {

	// Remove this skill
	q.create = @(__original) function()
	{
		__original();
		this.m.IsHidden = true;
		this.m.IsUsable = false;
	}

	q.onUpdate = @(__original) function(_properties)
	{
		__original(_properties);
		this.m.IsHidden = true;
		this.m.IsUsable = false;
	}

});	
