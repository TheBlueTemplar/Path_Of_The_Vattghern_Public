::TLW.HooksMod.hook("scripts/items/weapons/named/named_goblin_pike", function (q) {

	q.onEquip = @(__original) function ()
	{
		__original();
		::Legends.Actives.grant(this, ::Legends.Active.LegendHaftstrike);
	}
	
});

