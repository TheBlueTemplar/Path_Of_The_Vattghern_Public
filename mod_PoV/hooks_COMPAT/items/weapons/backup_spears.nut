// These spears only use ammo for the backup throw disabled by PoV.
foreach (weapon in [
	"boar_spear",
	"fighting_spear",
	"militia_spear",
	"legend_wooden_spear",
	"ancient/ancient_spear",
	"ancient/legend_broadhead_spear",
	"ancient/legend_oxtongue_spear",
	"named/named_spear"
]) {
	::TLW.HooksMod.hook("scripts/items/weapons/" + weapon, function (q) {
		q.getTooltip = @(__original) function () {
			// Suppress ammo at the source instead of relying on tooltip row IDs.
			local ammoMax = this.m.AmmoMax;
			this.m.AmmoMax = 0;
			local result;
			try {
				result = __original();
			} catch (error) {
				this.m.AmmoMax = ammoMax;
				throw error;
			}
			this.m.AmmoMax = ammoMax;
			return result;
		}
	});
}
