::TLW.HooksMod.hook("scripts/states/world_state", function (q) {
    // This is only for game launch, then main menu music can be toggled in pov mod settings
    q.onShow = @(__original) function () {
        __original();

        ::logInfo("[PoV] Hooking world_state.onShow()...");

        // Check and Update PoV Main Menu logo on menu load
        local world_menu = ::MSU.Utils.getState("world_state").m.WorldMenuScreen;
        if (::MSU.isNull(world_menu) || world_menu.m.JSHandle == null) {
            return;
        }
        world_menu.m.JSHandle.asyncCall("updatePOVLogoImage", ::TLW.Mod.ModSettings.getSetting(::TLW.EnableMainMenuLogoID).getValue());

        ::logInfo("[PoV] Hooking world_state.onShow()... DONE");
    }

    // Fix for saves made before the banner fix in asset_manager (the battle standard is only
    // created once).
    q.onDeserialize = @(__original) function (_in) {
        __original(_in);

        local bannerID = ::World.Assets.getBannerID();
        local items = clone ::World.Assets.getStash().getItems();

        foreach (bro in ::World.getPlayerRoster().getAll()) {
            items.extend(bro.getItems().getAllItems());
        }

        foreach (item in items) {
            if (item == null || !::isKindOf(item, "player_banner")) {
                continue;
            }

            if (item.getVariant() == bannerID || item.m.Variants.find(bannerID) == null) {
                continue;
            }

            ::logWarning("[PoV] Banner is set to " + item.getVariant() + ", switching to " + bannerID);
            item.setVariant(bannerID);
        }
    }

});
