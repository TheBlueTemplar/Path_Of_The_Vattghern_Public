::TLW.HooksMod.hook("scripts/items/weapons/legend_militia_glaive", function (q) {

	q.onEquip = @(__original) function ()
	{
		__original();
		::Legends.Actives.grant(this, ::Legends.Active.LegendHaftstrike);
	}
	
});

