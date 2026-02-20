::TLW.HooksMod.hook("scripts/skills/special/nggh_mod_champion_loot", function ( q )
{
	q.onUpdate = @(__original) function (_properties)
	{
		this.removeSelf();
	}
});