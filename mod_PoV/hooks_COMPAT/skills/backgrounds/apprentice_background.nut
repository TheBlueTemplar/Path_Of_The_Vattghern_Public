::TLW.HooksMod.hook("scripts/skills/backgrounds/apprentice_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		local r = this.Math.rand(1,6);
		if (r == 1)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.HammerClassTree,
			]);
		} else if (r == 2)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.MilitiaClassTree,
			]);
		} else if (r == 3)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.PitchforkClassTree,
			]);
		} else if (r == 4)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.ClubClassTree,
			]);
		} else if (r == 5)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.RaiderClassTree,
			]);
		} else if (r == 6)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.PickaxeClassTree,
			]);
		}	
	}

	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();

		if (!actor.getFlags().has("PovEasyLearnRead"))
		{
			actor.getFlags().add("PovEasyLearnRead");
		}
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Can learn to read books much quicker, and without penalties."
			}
		);
		return ret;
	}
})
