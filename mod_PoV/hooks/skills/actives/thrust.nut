::TLW.HooksMod.hook("scripts/skills/actives/thrust", function ( q ) {

	q.m.IsThrowingWeapon <- false;
	q.m.IsHeavyThrowingWeapon <- false;
	q.m.IsGun <- false;

	q.setItem = @(__original) function(_item)
	{
		__original(_item);
		if (this.m.IsThrowingWeapon)
		{
			this.m.Name = "Weak Thrust";
			this.m.Description += "\n\nA weaker, ligther attack, made by a weapon not meant for melee. Cannot benefit from double grip.";
		} else if (this.m.IsHeavyThrowingWeapon)
		{
			this.m.Name = "Heavy Thrust";
			this.m.Description += "\n\nWhile this weapon is not meant for melee, it can be used to deliver a weigthy, strong melee attack.";
		} else if (this.m.IsGun)
		{
			this.m.Name = "Heavy Thrust";
			this.m.Description += "\n\nThe wielded weapon\'s pointy end allows it to effectively perform a heavy thrust, like a heavy spear.";
		}
	}

	q.isUsable = @(__original) function()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item.isItemType(this.Const.Items.ItemType.RangedWeapon) && this.m.IsGun == false)
		{
			return !this.Tactical.isActive() || this.skill.isUsable() && this.getAmmo() > 0;
		}
		else
		{
			return this.skill.isUsable();
		}
	}

	q.getAmmo <- function()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item == null)
		{
			return 0;
		}

		return item.getAmmo();
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		if (this.m.IsThrowingWeapon && _skill == this)
		{
			_properties.DamageTotalMult *= _properties.IsSpecializedInThrowing ? 0.85 : 0.70;
			_properties.DamageDirectMult *= 0.85;
			_properties.MeleeSkill += 20;
		}
		else if (this.m.IsHeavyThrowingWeapon && _skill == this)
		{
			_properties.DamageTotalMult *= _properties.IsSpecializedInThrowing ? 0.95 : 0.80;
			_properties.DamageDirectMult *= 0.90;
			_properties.MeleeSkill += 20;
			this.m.FatigueCost = 16;
			this.m.ActionPointCost = 5;
		}
		else if (this.m.IsGun && _skill == this)
		{
			_properties.DamageTotalMult *= 0.80;
			_properties.DamageDirectMult *= 1.40;
			_properties.DamageArmorMult *= 0.80;
			_properties.MeleeSkill += 20;
			this.m.FatigueCost = 20;
			//this.m.ActionPointCost = 5;
		}
		else
		{
			__original(_skill, _targetEntity, _properties);
		}
	}

});	