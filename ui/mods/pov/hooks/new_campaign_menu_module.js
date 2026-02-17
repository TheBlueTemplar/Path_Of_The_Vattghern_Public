mod_PoV.Hooks.NewCampaignMenuModule_createDIV = NewCampaignMenuModule.prototype.createDIV;
NewCampaignMenuModule.prototype.createDIV = function (_parentDiv)
{
	mod_PoV.Hooks.NewCampaignMenuModule_createDIV.call(this, _parentDiv);
	this.mDifficultyLegendaryLabel.html('Death March');
	this.mEconomicDifficultyLegendaryLabel.html('Depression');

	// Rename "Starting Funds"
	this.mContainer.find('.title-font-big').each(function()
	{
		if ($(this).text().trim() === 'Starting Funds')
		{
			$(this).html('Starting Resources'); // <-- your new name here
		}
	});
}

/*var povCreateDIV = NewCampaignMenuModule.prototype.createDIV; // Note: the var must be unique as the var itself is a global var, you don't want to overwrite something from other mods
NewCampaignMenuModule.prototype.createDIV = function (_parentDiv)
{
povCreateDIV.call(this, _parentDiv); // to call the original
this.mDifficultyLegendaryLabel.html('Your new name')
}*/
