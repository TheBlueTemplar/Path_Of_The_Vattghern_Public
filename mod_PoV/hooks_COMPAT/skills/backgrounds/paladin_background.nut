::TLW.HooksMod.hook("scripts/skills/backgrounds/paladin_background", function(q)
{
	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();

		if (!actor.getFlags().has("PovCanRead"))
		{
			actor.getFlags().add("PovCanRead");
		}

		if (!actor.getFlags().has("PovReadLimitEducated"))
		{
			actor.getFlags().add("PovReadLimitEducated");
		}
	}

	q.getTooltip = @(__original) function()
	{ 
		//local ret = __original(); // removed a legends change
		local ret = this.character_background.getTooltip();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Can read books, with +1 to the max limit."
			}
		);
		if (this.World.Assets.getOrigin().getID() != "scenario.paladins")
		{
			ret.push(
				{
					id = 13,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Gain the [color=" + this.Const.UI.Color.povTooltipBlue + "]\"Oathsworn\"[/color] trait, allowing the use of minor oaths."
				}
			);
		}
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		//__original(_properties);
		// removed a legends change

		this.character_background.onUpdate(_properties);
		local actor = this.getContainer().getActor();
		
		if(::World.State.getPlayer() != null)
		{
			if (this.World.Assets.getOrigin().getID() != "scenario.paladins")
			{
				if (!actor.getSkills().hasSkill("trait.pov_oathsworn"))
				{
					actor.getSkills().add(this.new("scripts/skills/traits/pov_oathsworn_trait"));
				}
			}	
		}	
	}

})
