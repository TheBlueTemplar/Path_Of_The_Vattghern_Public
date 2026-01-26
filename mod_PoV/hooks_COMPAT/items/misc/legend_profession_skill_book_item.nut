::TLW.HooksMod.hook("scripts/items/misc/legend_profession_skill_book_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Icon = "special/pov_book_profession.png";
		this.m.Value = 2250; // up from 1500
	}	

});

