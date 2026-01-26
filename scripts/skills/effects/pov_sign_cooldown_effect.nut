this.pov_sign_cooldown_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_sign_cooldown";
		this.m.Name = "Sign Caster Cooldown";
		this.m.Description = "This character has recently cast a sign, and needs time to recover before casting another one. \n\n Time Left: "+ this.m.TurnsLeft+" Turns";
		this.m.Icon = "skills/pov_sign_cooldown.png";
		this.m.IconMini = "pov_mini_sign_cooldown";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has recently cast a sign, and needs time to recover before casting another one. \n\n Time Left: [color=" + this.Const.UI.Color.NegativeValue + "]"+ this.m.TurnsLeft+"[/color] Turns";
	}

	function onAdded() 
	{
		this.spawnIcon("pov_medium_sign_cooldown", this.getContainer().getActor().getTile());
		local actor = this.getContainer().getActor();
		if (actor.getCurrentProperties().IsSpecializedInSigns)
		{
			this.m.TurnsLeft = 1;
		}
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});
