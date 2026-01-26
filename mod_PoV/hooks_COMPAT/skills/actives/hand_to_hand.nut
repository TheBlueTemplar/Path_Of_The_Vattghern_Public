::TLW.HooksMod.hook("scripts/skills/actives/hand_to_hand", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.Name = "Punch!";
	}
});	

//dunno why it was not named like that...