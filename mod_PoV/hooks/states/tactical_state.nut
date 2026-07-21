::TLW.HooksMod.hook("scripts/states/tactical_state", function ( q ) {
// This is only for game launch, then main menu music can be toggled in pov mod settings
	q.onShow = @(__original) function()
	{	
		__original();
		
		::logInfo("[PoV] Hooking tactical_state.onShow()...");

	    // Check and Update PoV Main Menu logo on menu load
	    local tactical_menu = ::MSU.Utils.getState("tactical_state").m.TacticalMenuScreen;
	    if (::MSU.isNull(tactical_menu) || tactical_menu.m.JSHandle == null) return;
	    tactical_menu.m.JSHandle.asyncCall("updatePOVLogoImage", ::TLW.Mod.ModSettings.getSetting(::TLW.EnableMainMenuLogoID).getValue());

	    ::logInfo("[PoV] Hooking tactical_state.onShow()... DONE");
	}

    // Deaths that happened while the entity was still moving, see actor.nut kill().
    q.m.PendingDeaths <- [];

    q.addPendingDeath <- function (_entity, _killer, _skill, _fatalityType, _silent) {
        this.m.PendingDeaths.push({
            Entity = _entity,
            Killer = _killer,
            Skill = _skill,
            FatalityType = _fatalityType,
            Silent = _silent
        });
    }

    q.onInit = @(__original) function () {
        __original();
        this.m.PendingDeaths = [];
    }

    q.onUpdate = @(__original) function () {
        for (local i = this.m.PendingDeaths.len() - 1; i >= 0; --i) {
            local pending = this.m.PendingDeaths[i];

            if (!::MSU.isNull(pending.Entity)
                && ::Tactical.getNavigator().isTravelling(pending.Entity))
            {
                continue;
            }

            this.m.PendingDeaths.remove(i);

            if (::MSU.isNull(pending.Entity)
                || !pending.Entity.isAlive()
                || !pending.Entity.isDying())
            {
                continue;
            }

            try {
                pending.Entity.kill(
                    ::MSU.isNull(pending.Killer) ? null : pending.Killer,
                    ::MSU.isNull(pending.Skill) ? null : pending.Skill,
                    pending.FatalityType,
                    pending.Silent
                );
            } catch (_e) {
                ::logError("[PoV] Death of " + pending.Entity.getName() + " threw: " + _e);
            }
        }

        __original();
    }

});
