::TLW.HooksMod.hook("scripts/entity/tactical/objective/donkey", function ( q )
{
	q.create = @(__original) function()
	{
		__original();
		this.m.IsActingEachTurn = true;
		this.m.IsNonCombatant = true;
	}

	q.onInit = @(__original) function()
	{	
		__original()

		// Mutagen Drop (meme)
		if (!::MSU.isKindOf(this.actor, "player")) 
		{
			this.actor.m.OnDeathLootTable.push([2.5,"scripts/items/misc/anatomist/pov_donkey_mutagen_item"]);
		}

		// Chaos Mutation
		::TLW.Chaos.add_mutation_all(this.actor, false)

		// Skills Additions
		::Legends.Actives.grant(this, ::Legends.Active.LegendDonkeyKick);
		if(::Legends.isLegendaryDifficulty())
		{
			::Legends.Perks.grant(this, ::Legends.Perk.LegendMuscularity);
			::Legends.Perks.grant(this, ::Legends.Perk.Steadfast);
			//::Legends.Perks.grant(this, ::Legends.Perk.Stalwart);
			b.Hitpoints += 40;
			b.MeleeSkill += 10;
			b.MeleeDefense += 10;
			b.Initiative += 15;
			b.ActionPoints += 1;
		}
		this.m.Skills.update();

		//Stats Changes
		local b = this.m.BaseProperties;
		//b.MovementAPCostAdditional += 10; // cant move pretty much
		b.IsImmuneToBleeding = false;
		b.IsImmuneToStun = false;
		b.IsImmuneToRoot = false;
		b.IsImmuneToPoison = false;
		b.IsAffectedByNight = true;
		if (this.World.getTime().Days >= 75)
		{
			b.Hitpoints += 80;
			b.MeleeSkill += 75;
			b.MeleeDamageMult *= 1.10;
			b.MeleeDefense += 35;
			b.Initiative += 40;
			b.ActionPoints += 9;
		} else
		{
			b.Hitpoints += 40;
			b.MeleeSkill += 50;
			b.MeleeDamageMult *= 1.05;
			b.MeleeDefense += 20;
			b.Initiative += 20;
			b.ActionPoints += 7;
		}
	}

});
