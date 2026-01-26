::TLW.HooksMod.hook("scripts/entity/world/settlements/buildings/arena_building", function( q ) {

	q.onUpdateDraftList = @(__original) function ( _list )
	{
		_list.push("pov_mutant_background");
		__original( _list );
	}

});