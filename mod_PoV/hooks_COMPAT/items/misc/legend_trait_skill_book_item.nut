::TLW.HooksMod.hook("scripts/items/misc/legend_trait_skill_book_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Icon = "special/pov_book_trait.png";
		this.m.Value = 2250; // up from 1500
	}	

});

