::TLW.HooksMod.hook("scripts/entity/world/settlements/buildings/tavern_building", function( q ) {

	q.getDrinkResult = @(__original) function () // all legends code, I do the edit
	{
		local bros = this.World.getPlayerRoster().getAll();

		if (this.World.Assets.getMoney() < this.Math.round(bros.len() * 5 * this.m.Settlement.getBuyPriceMult()))
		{
			return null;
		}

		this.Sound.play(this.Const.Sound.TavernRound[this.Math.rand(0, this.Const.Sound.TavernRound.len() - 1)]);
		this.World.Assets.addMoney(this.Math.round(bros.len() * -5 * this.m.Settlement.getBuyPriceMult()));
		++this.m.RoundsGiven;
		this.m.LastRoundTime = this.Time.getVirtualTimeF();
		local result = {
			Intro = this.Const.Strings.PayTavernRoundIntro[this.Math.rand(0, this.Const.Strings.PayTavernRoundIntro.len() - 1)],
			Result = []
		};

		foreach( b in bros )
		{
			if (result.Result.len() >= 5)
			{
				break;
			}

			local drunkChance = (this.m.RoundsGiven - 1) * 10;
			if (this.World.Assets.getOrigin().getID() == "scenario.legends_troupe")
			{
			drunkChance = drunkChance * 0.5;
			}

			if (!b.getSkills().hasEffect(::Legends.Effect.Drunk))
			{
				// my additions are at bottom (some are mults)
				if (b.getSkills().hasTrait(::Legends.Trait.Drunkard))
				{
					drunkChance = drunkChance + 20;
				}

				if (b.getSkills().hasTrait(::Legends.Trait.Strong))
				{
					drunkChance = drunkChance - 10;
				}

				if (b.getSkills().hasTrait(::Legends.Trait.Tough))
				{
					drunkChance = drunkChance - 10;
				}

				if (b.getSkills().hasTrait(::Legends.Trait.Fragile))
				{
					drunkChance = drunkChance + 10;
				}

				if (b.getSkills().hasTrait(::Legends.Trait.Tiny))
				{
					drunkChance = drunkChance + 10;
				}

				if (b.getSkills().hasTrait(::Legends.Trait.Bright))
				{
					drunkChance = drunkChance - 10;
				}
				else if (b.getSkills().hasTrait(::Legends.Trait.Dumb))
				{
					drunkChance = drunkChance + 10;
				}

				// my additions
				if (b.getSkills().hasPerk(::Legends.Perk.LegendRecuperation))
				{
					drunkChance = drunkChance * 0.5;
				}

				if (b.getSkills().hasTrait(::Legends.Trait.Lucky))
				{
					drunkChance = drunkChance - 10;
				}

				if (b.getSkills().hasSkill("trait.pov_witcher"))
				{
					drunkChance = drunkChance * 0.5;
				}
			}
			else
			{
				drunkChance = 0;
				if (!b.getSkills().hasTrait(::Legends.Trait.Drunkard))
				{
					if (this.Math.rand(1, 100) <= this.m.RoundsGiven + 5)
					{
						::Legends.Traits.grant(b, ::Legends.Trait.Drunkard, function(_trait) {
							result.Result.push({
								Icon = _trait.getIcon(),
								Text = b.getName() + " is now a drunkard."
							});
						}.bindenv(this));
					}
				}
			}

			if (this.Math.rand(1, 100) <= drunkChance)
			{
				::Legends.Effects.grant(b, ::Legends.Effect.Drunk, function(_effect) {
					result.Result.push({
						Icon = _effect.getIcon(),
						Text = b.getName() + " is now drunk."
					});
				}.bindenv(this));
			}

			if ((b.getLastDrinkTime() == 0 || this.Time.getVirtualTimeF() - b.getLastDrinkTime() > this.World.getTime().SecondsPerDay) && this.Math.rand(1, 100) <= 35)
			{
				b.setLastDrinkTime(this.Time.getVirtualTimeF());
				b.improveMood(this.Const.MoodChange.DrunkAtTavern, "Got drunk with the company");
				result.Result.push({
					Icon = this.Const.MoodStateIcon[b.getMoodState()],
					Text = b.getName() + this.Const.MoodStateEvent[b.getMoodState()]
				});
			}
		}

		return result;
	}

});