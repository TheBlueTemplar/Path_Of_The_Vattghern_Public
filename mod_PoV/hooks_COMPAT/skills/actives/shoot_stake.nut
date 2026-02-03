::TLW.HooksMod.hook("scripts/skills/actives/shoot_stake", function ( q ) {

	q.onAfterUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		this.m.DirectDamageMult = _properties.IsSpecializedInCrossbows ? 0.6 : 0.5;
	}
});	
