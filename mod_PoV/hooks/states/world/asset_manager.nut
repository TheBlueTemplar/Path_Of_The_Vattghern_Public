::TLW.HooksMod.hook("scripts/states/world/asset_manager", function (q) {

    // This is for setting ::World.Assets.m.[...] variables
    q.m.HasMutagenResearch <- false;

    // The campaign banner is stored twice: m.Banner as a string, m.BannerID as a number inside
    // it. onSerialize writes the ID with writeU8, so anything above 255 overflows, and PoV banners
    // havee id 1822 and 1823 so they come back as 30 and 31. Here we recompute the ID from the
    // string so banners/shields are redrawn correctly.
    q.onDeserialize = @(__original) function (_in) {
        __original(_in);

        if (this.m.Banner == null) {
            return;
        }

        local separator = this.m.Banner.find("_");
        if (separator == null) {
            return;
        }

        this.m.BannerID = this.m.Banner.slice(separator + 1).tointeger();
    }

});
