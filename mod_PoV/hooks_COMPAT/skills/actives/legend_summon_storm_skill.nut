// Fix Legends Summon Storm not granting its effect on second cast because of the customized rain.
::TLW.HooksMod.hook("scripts/skills/actives/legend_summon_storm_skill", function (q) {
	q.onUse = @(__original) function (_user, _targetTile) {
		local weather = this.Tactical.getWeather();
		local rain = weather.createRainSettings();

		local caster = this.getContainer().getActor();
		local alreadyWet = this.getContainer().hasEffect(::Legends.Effect.LegendRain)
			|| (weather.IsRaining && caster.getCurrentProperties().IsAffectedByRain);

		if (alreadyWet) {
			if (this.m.SoundOnLightning.len() != 0) {
				this.Sound.play(this.m.SoundOnLightning[this.Math.rand(0, this.m.SoundOnLightning.len() - 1)], this.Const.Sound.Volume.Skill * 2.0, _user.getPos());
			}
			if (!this.m.Container.hasEffect(::Legends.Effect.LionheartPotion)) {
				::Legends.Effects.grant(this, ::Legends.Effect.LionheartPotion);
			}

			weather.setAmbientLightingColor(this.createColor(this.Const.Tactical.AmbientLightingColor.Storm));
			weather.setAmbientLightingSaturation(this.Const.Tactical.AmbientLightingSaturation.Storm);
			local clouds = weather.createCloudSettings();
			clouds.Type = this.getconsttable().CloudType.StaticFog;
			clouds.MinClouds = 12;
			clouds.MaxClouds = 18;
			clouds.MinAlpha = 0.25;
			clouds.MaxAlpha = 0.5;
			clouds.MinScale = 2.0;
			clouds.MaxScale = 3.0;
			weather.buildCloudCover(clouds);
			rain.MinDrops = 150;
			rain.MaxDrops = 150;
			rain.NumSplats = 50;
			rain.MinVelocity = 400.0;
			rain.MaxVelocity = 500.0;
			rain.MinAlpha = 1.0;
			rain.MaxAlpha = 1.0;
			rain.MinScale = 0.75;
			rain.MaxScale = 1.0;
			weather.buildRain(rain);
			this.Sound.setAmbience(0, this.Const.SoundAmbience.Rain, this.Const.Sound.Volume.Ambience, 0);
		} else {
			local everyone = this.Tactical.Entities.getAllInstances();
			foreach (ever in everyone) {
				foreach (e in ever) {
					if (e.getBaseProperties().IsAffectedByRain) {
						::Legends.Effects.grant(e, ::Legends.Effect.LegendRain);
					}
				}
			}
			weather.setAmbientLightingColor(this.createColor(this.Const.Tactical.AmbientLightingColor.LightRain));
			weather.setAmbientLightingSaturation(this.Const.Tactical.AmbientLightingSaturation.LightRain);
			rain.MinDrops = 20;
			rain.MaxDrops = 60;
			rain.NumSplats = 30;
			rain.MinVelocity = 250.0;
			rain.MaxVelocity = 500.0;
			rain.MinAlpha = 0.3;
			rain.MaxAlpha = 0.7;
			rain.SplatAlpha = 0.5;
			rain.MinScale = 0.6;
			rain.MaxScale = 1.1;
			weather.buildRain(rain);
			this.Sound.setAmbience(0, this.Const.SoundAmbience.RainLight, this.Const.Sound.Volume.Ambience, 0);
		}
	}
});
