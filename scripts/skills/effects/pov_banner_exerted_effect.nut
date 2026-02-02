this.pov_banner_exerted_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Duration = 3
	},
	function create()
	{
		this.m.ID = "effects.pov_banner_exerted";
		this.m.Name = "Exerted Bannerman";
		this.m.Icon = "skills/pov_banner_exerted_effect.png";
		this.m.IconMini = "";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "This character is [color=" + this.Const.UI.Color.povPerkBlue + "]Exerted[/color] after recently putting their heart to galvanizing the company, and they now have a reduced capability of doing so.\n\n For a few days, the \"Raise the Banner!!\" skill will not be usable.";
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
			//will last for x more days kinda shit
		];

		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Resolve reduced by [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]."
			}
		);

		if (this.m.Duration >= 0)
		{
			ret.push(
				{
					id = 11,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Will be gone in [color=" + this.Const.UI.Color.NegativeValue + "]"+this.m.Duration+"[/color] Days."
				}
			);
		}

		return ret;
	}

	

	function onUpdate( _properties )
	{
		// Debuffs
		_properties.BraveryMult *= 0.85;	
	}

	function onAdded()
	{
		this.spawnIcon("pov_medium_banner_exerted_effect", this.getContainer().getActor().getTile());
	}

	function onNewDay()
	{
		this.m.Duration -= 1;
		if (this.m.Duration <= 0)
		{
			this.removeSelf();
		}
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		_out.writeU16(this.m.Duration);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.Duration = _in.readU16();
	}

});

