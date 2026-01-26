this.pov_yrden_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 0
	},
	function create()
	{
		this.m.ID = "effects.pov_yrden";
		this.m.Name = "Trapped By Yrden";
		this.m.Description = "This character is trapped by a Yrden sign, losing [color=" + this.Const.UI.Color.NegativeValue + "]40%[/color] Initiative, and [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color] attacks and defenses. Some skills and effects are also not usable while trapped. Lasts for 1 round, unless the character stays in the trap.";
		this.m.Icon = "skills/pov_yrden_effect.png";
		this.m.IconMini = "pov_mini_yrden_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is trapped by a Yrden sign, losing [color=" + this.Const.UI.Color.NegativeValue + "]40%[/color] Initiative, and [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color] attacks and defenses. Some skills and effects are also not usable while trapped. Lasts for 1 round, unless the character stays in the trap.";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		if (this.m.TurnsLeft >= 1)
		{
			ret.extend([
				{
					id = 7,
					type = "hint",
					icon = "ui/icons/special.png",
					text = "This effect will last for [color=" + this.Const.UI.Color.NegativeValue + "]"+this.m.TurnsLeft+"[/color] more turns"
				}
			]);
		}

		return ret;
	}

	function onAdded() 
	{
		this.m.TurnsLeft = 1;
		this.spawnIcon("pov_medium_yrden_effect", this.getContainer().getActor().getTile());
		/*local actor = this.getContainer().getActor();
		if (actor.hasSprite("pov_front_socket"))
		{
			local quen_bubble = actor.getSprite("pov_front_socket");
			quen_bubble.setBrush("pov_bubble");
			quen_bubble.Color = this.createColor("#edc905"); // Gold
			quen_bubble.Saturation = 0.8;
			quen_bubble.Scale = 1.25;
			//quen_bubble.varySaturation(0.1);
			quen_bubble.varyColor(0.05, 0.05, 0.05);
			quen_bubble.Visible = true;

			actor.setRenderCallbackEnabled(true);
			actor.setAlwaysApplySpriteOffset(true);
			//this.m.isActive = true;
		}*/
	}

	function onRemoved()
	{	
		
	}

	function onUpdate( _properties )
	{
		_properties.InitiativeMult		*= 0.60;
		_properties.MeleeSkillMult		*= 0.90;
		_properties.RangedSkillMult		*= 0.90;
		_properties.MeleeDefenseMult	*= 0.90;
		_properties.RangedDefenseMult	*= 0.90; 
		_properties.YrdenTrapped		 = true; // lots of shit i can do with dis
	}

	function onTurnEnd()
	{
		this.m.TurnsLeft -= 1;

		if (this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}


});
