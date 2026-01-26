this.pov_bola_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_bola";
		this.m.Name = "Bola\'d";
		this.m.Description = "This character has been tangled by a bola, losing [color=" + this.Const.UI.Color.NegativeValue + "] 20% [/color] initiative.";
		this.m.Icon = "skills/pov_bola_effect.png";
		this.m.IconMini = "pov_mini_bola_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has been tangled by a bola, losing [color=" + this.Const.UI.Color.NegativeValue + "] 20% [/color] initiative. Lasts for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function onAdded() 
	{
		this.spawnIcon("pov_medium_bola_effect", this.getContainer().getActor().getTile());
	}

	function onUpdate( _properties )
	{
		_properties.InitiativeMult *= 0.80;
	}


	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});
