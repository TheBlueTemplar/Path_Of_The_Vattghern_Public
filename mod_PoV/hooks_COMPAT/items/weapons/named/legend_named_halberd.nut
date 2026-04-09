::TLW.HooksMod.hook("scripts/items/weapons/named/legend_named_halberd", function (q) {

	q.onEquip = @(__original) function ()
	{
		__original();
		::Legends.Actives.grant(this, ::Legends.Active.LegendHaftstrike);
	}
	
});

