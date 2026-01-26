::TLW.HooksMod.hook("scripts/items/misc/legend_skill_book", function (q) {
	
	// This hook heavily overwrites and reworks the Legends Skill Books!

	q.create = @(__original) function ()
	{
		__original();
		this.m.IsPrecious = true;
		this.m.Cooldown = 40; // also need to hook children, just to be sure
		this.m.HasToBeIdentified = false; // safety net in case they change it
		this.m.Value = 3000; // just for reference
	}	

	q.getTooltip = @(__original) function ()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = getName()
			},
			{
				id = 2,
				type = "description",
				text = getDescription()
			},
			{
				id = 66,
				type = "text",
				text = getValueString()
			},
			{
				id = 3,
				type = "image",
				image = getIcon()
			},
			{
				id = 65,
				type = "text",
				text = "Right-click to use on a character. Intensely studying will lead to [color=" + ::Const.UI.Color.NegativeValue + "]burnout[/color]. What kind of mercenary wants to study?"
			},
			{
				id = 67,
				type = "text",
				text = "Will apply a cooldown until you can read again, depending on perks, traits and background. Base cooldown is: [color=" + ::Const.UI.Color.NegativeValue + "]" + this.m.Cooldown + "[/color] days."
			},
			{
				id = 67,
				type = "text",
				text = "Characters have a base limit of [color=" + ::Const.UI.Color.NegativeValue + "]1[/color] for books they can read. Educated Backgrounds gain [color=" + ::Const.UI.Color.NegativeValue + "]+1[/color], and some perks and traits may affect that limit."
			}
		];

		local selection = this.m.PerkGroupSelection;
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Reading this will allow the user to learn [color=%negative%]" + selection + "[/color] perk group. Following perks will be added if not already in the tree:"
			});

			local tree = ::MSU.deepClone(this.m.PerkGroups.filter(function (_, _it) { return _it.Name == this.m.PerkGroupSelection; }.bindenv(this)).top().Tree);
			foreach (perk in tree.reduce(function (a, b) { a.extend(b); return a; }).map(@(_def) ::Const.Perks.PerkDefObjects[_def])) {
				result.push({
					id = 10,
					type = "text",
					text = "[leg_img](gfx/" + perk.Icon + ",height=20px,width=20px)[/leg_img] [color=%perk%]" + perk.Name + "[/color]"
				});
			}

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "A character must be able to read, in order to use this item. (Depends on Background, perks and traits)",
		});

		//optional?
		/*local actor = ::World.State.m.CharacterScreen.getSelectedActor();
		if (::World.State.isInCharacterScreen() && actor != null) {
			local injury = ::Legends.Effects.get(actor, ::Legends.Effect.LegendHeadache);
			if (injury != null) {
				result.push({
					id = 10,
					type = "text",
					icon = "ui/icons/cancel.png",
					text = "Cannot be used for next [color=%negative%]" + injury.m.HealingTimeMin + "-" + injury.m.HealingTimeMax + "[/color] days because of [color=%status%]" + injury.getName() + "[/color] status"
				});
				return result;
			}
			local effect = ::Legends.Effects.get(actor, ::Legends.Effect.LegendIrritable);
			if (effect != null) {
				result.push({
					id = 10,
					type = "text",
					icon = "ui/icons/cancel.png",
					text = "Cannot be used for next [color=%negative%]" + effect.m.HealingTime + "[/color] days because of [color=%status%]" + effect.getName() + "[/color] status"
				});
				return result;
			}
		}*/

		return result;
	}

	q.getName = @(__original) function ()
	{
		return this.m.BookName + " " + this.m.PerkGroupSelection;
	}

	q.isAbleToUseScroll = @(__original) function (_actor)
	{
		local effect = ::Legends.Effects.get(_actor, ::Legends.Effect.LegendIrritable);
		local injury = ::Legends.Effects.get(_actor, ::Legends.Effect.LegendHeadache);
		local limit = 1; // default book read limit

		if (_actor.getFlags().has("PovReadLimitEducated"))
		{
			limit += 1;
		}

		if (_actor.getSkills().hasPerk(::Legends.Perk.Student))
		{
			limit += 1;
		}
		
		if (_actor.getSkills().hasTrait(::Legends.Trait.Bright))
		{
			limit += 1;
		}

		if (_actor.getSkills().hasPerk(::Legends.Perk.LegendScholar))
		{
			limit += 92;
		}

		// Cant read if you are Dumb/Brain Damaged/Wildman
		if (_actor.getSkills().hasTrait(::Legends.Trait.Dumb) || _actor.getSkills().hasSkill("injury.brain_damage") || _actor.getBackground().getID() == "background.wildman")
			return "It is impossible for this character to read, and hopeless to try teaching them!";

		// Cant read if....well....cant read! (PovCannotRead flag currently unused)
		if (!_actor.getFlags().has("PovCanRead") || _actor.getFlags().has("PovCannotRead"))
			return "Failed to use this item as the user [color=" + ::Const.UI.Color.NegativeValue + "]cannot read![/color]";

		// Book limit
		if (_actor.getFlags().getAsInt("PovSkillBookCount") >= limit)
			return "This character cannot read any more Skill Books (Limit of " + limit +" reached)";

		// cant read if has recently read another book
		if (injury != null)
			return "Failed to use this item as the user will be recovering from the last reading for another [color=" + ::Const.UI.Color.NegativeValue + "]" + injury.m.HealingTimeMin + "-" + injury.m.HealingTimeMax +"[/color] days.";
		if (effect != null)
			return "Failed to use this item as the user will be recovering from the last reading for another [color=" + ::Const.UI.Color.NegativeValue + "]" + effect.m.HealingTime + "-" + effect.m.HealingTime +"[/color] days.";

		// Injured? CANT READ!
		if (_actor.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			 return "The user cannot read a book now, as they are busy being [color=" + ::Const.UI.Color.NegativeValue + "]recovering from injury[/color]";

		return true;
	}

	q.onUse = @(__original) function (_actor,_item = null)
	{
		local result = this.isAbleToUseScroll(_actor);
		if (typeof result == "string")
		{
			::Sound.play("sounds/scribble.wav", ::Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip(result));
			return false;
		}

		local tree = null;
		foreach (perkGroup in this.m.PerkGroups)
		{
			if (perkGroup.Name == this.m.PerkGroupSelection)
			{
				tree = perkGroup;
			}
		}

		if (_actor.getBackground().hasPerkGroup(tree)) {
			::Sound.play("sounds/scribble.wav", ::Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("[color=%negative%]The character already knows what is in this book, and cannot benefit from reading it.[/color]"));
			return false;
		}

		_actor.getBackground().addPerkGroup(tree.Tree);

		::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("The [color=%negative%]%group%[/color] perk group has been added to this character.", [["group", this.m.PerkGroupSelection]]));
		::Sound.play("sounds/scribble.wav", ::Const.Sound.Volume.Inventory);

		local cooldown = this.m.Cooldown;

		if (_actor.getSkills().hasPerk(::Legends.Perk.Student) || _actor.getSkills().hasTrait(::Legends.Trait.Bright))
		{
			cooldown = 30;
		}

		if (_actor.getSkills().hasPerk(::Legends.Perk.LegendScholar))
		{
			cooldown = 15;
		}

		//_actor.getFlags().increment("LegendsScrollCount"); why have that here..?
		_actor.getFlags().increment("PovSkillBookCount");
		::Legends.Effects.grant(_actor, ::Legends.Effect.LegendHeadache, function (_effect) {
			_effect.m.IrritableHealingTime = cooldown;
		}.bindenv(this));

		::Sound.play("sounds/scribble.wav", ::Const.Sound.Volume.Inventory);
		return true;
	}
});

