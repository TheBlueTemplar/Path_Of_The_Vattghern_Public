::TLW.HooksMod.hook("scripts/skills/traits/weasel_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25[/color] Melee Defense and [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Ranged Defense while retreating"
			}
		];
	}

	q.onBeingAttacked = @(__original) function( _attacker, _skill, _properties )
	{
		if (("State" in this.Tactical) && this.Tactical.State != null && this.Tactical.State.isScenarioMode())
		{
			return;
		}

		if (this.getContainer().getActor().isPlacedOnMap() && this.Tactical.State.isAutoRetreat() && this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == this.getContainer().getActor().getID())
		{
			_properties.MeleeDefense += 25;
			_properties.RangedDefense += 10;
		}
	}

})
