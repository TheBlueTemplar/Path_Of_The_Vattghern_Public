::TLW.HooksMod.hook("scripts/skills/injury/sickness_injury", function ( q ) {

	q.onAdded = @(__original) function() 
	{
		this.getContainer().add(::new("scripts/skills/actives/pov_vomit_skill"));
		__original();
	}

	q.onRemoved = @(__original) function() 
	{
		__original();
		this.getContainer().removeByID("actives.pov_vomit")
	}
});	
