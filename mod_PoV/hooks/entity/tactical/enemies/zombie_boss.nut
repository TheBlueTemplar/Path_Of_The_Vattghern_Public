::TLW.HooksMod.hook("scripts/entity/tactical/enemies/zombie_boss", function ( q )
{

	q.onInit = @(__original) function()
	{
		__original()

		// Corpse Drop
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			//IDK WTF THIS FILE IS AND WHO TIS ABOUT
			::TLW.CorpseDrop.addCorpseDrop(this.actor, ::TLW.Corpse.SkeletonBoss);
	  	}

	  	// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

	}

});