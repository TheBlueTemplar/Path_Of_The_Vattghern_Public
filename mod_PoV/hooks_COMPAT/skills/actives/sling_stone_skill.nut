::TLW.HooksMod.hook("scripts/skills/actives/sling_stone_skill", function ( q ) {

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		local ammo = this.getAmmo();
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Ammo);

		if (ammo > 0)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/ammo.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]" + ammo + "[/color] special sling stones left"
			});
		}
		else if (item != null)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Special sling stones run out.[/color] Will now use regular ones instead"
			});
		}

		return ret;
	}

	q.getAmmo <- function()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Ammo);

		if (item == null)
		{
			return 0;
		}

		if (item.getAmmoType() == this.Const.Items.AmmoType.SlingStones)
		{
			return item.getAmmo();
		}
	}

	q.consumeAmmo <- function()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Ammo);

		if (item != null && item.m.Ammo >= 1)
		{
			item.consumeAmmo();
		}
	}

	q.onUse = @(__original) function( _user, _targetTile )
	{	
		this.consumeAmmo();
		__original( _user, _targetTile);
	}

});	

