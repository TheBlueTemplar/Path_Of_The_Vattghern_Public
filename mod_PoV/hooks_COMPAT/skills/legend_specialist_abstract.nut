::TLW.HooksMod.hook("scripts/skills/legend_specialist_abstract", function (q) {

	/*if (!::TLW.hasSSU)
	{
		// Remove this skill from legends, with exceptions
		q.onUpdate = @(__original) function( _properties )
		{
			__original(_properties);

			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				// exceptions
				if (this.m.ID != "perk.legend_specialist_musician" && this.m.ID != "perk.legend_specialist_selfdefense")
				{
					this.m.IsActive = false;
					this.m.IsHidden = true;
				}
			}

		};

	}*/

	q.calculateSpecialistBonus = @(__original) function (_stat, _item) {
		// PoV System: target weps/groups get full bonus, others get 10% + 4% per level, up to 50% at lvl 10.
		local actor = this.getContainer().getActor();
		if (this.hasSpecialistWeapon(_item) || !actor.isPlayerControlled()) {
			return _stat;
		}

		// Multiply before dividing to avoid rounding exact integer bonuses down by one.
		return this.Math.floor(this.Math.min(4 * actor.getLevel() + 10, 50) * _stat / 100.0);
	}
});
