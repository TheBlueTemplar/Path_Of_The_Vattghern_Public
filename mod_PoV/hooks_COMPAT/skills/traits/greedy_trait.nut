::TLW.HooksMod.hook("scripts/skills/traits/greedy_trait", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.Description = "I want more! This character is greedy and will demand a higher daily payment than others with a similar background, as well as being fast to leave you if you ever run out of crowns. On the flip side, ever eager for danger pay, this character performs better the higher the wage. Gains [color=" + this.Const.UI.Color.NegativeValue + "]1[/color] to each attribute for every [color=" + this.Const.UI.Color.NegativeValue + "]15[/color] gold in daily wage paid.";
	}

	q.getTooltip = @(__original) function ()
	{
		local bonus = this.Math.floor(this.getContainer().getActor().getDailyCost() / 15.0);
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
				icon = "ui/icons/asset_money.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+25[/color]% Daily Wage"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "[/color] to every attribute"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.DailyWageMult *= 1.25;
		local bonus = this.Math.floor(this.getContainer().getActor().getDailyCost() / 15.0);
		_properties.Hitpoints += bonus;
		_properties.Bravery += bonus;
		_properties.Stamina += bonus;
		_properties.Initiative += bonus;
		_properties.MeleeSkill += bonus;
		_properties.RangedSkill += bonus;
		_properties.MeleeDefense += bonus;
		_properties.RangedDefense += bonus;
	}
})
