::TLW.HooksMod.hook("scripts/items/misc/legend_weapon_skill_book_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Icon = "special/pov_book_weapon.png";
		this.m.Value = 2250; // up from 1500
	}	

});

