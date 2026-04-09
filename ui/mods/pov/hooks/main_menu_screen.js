// Necro's stuff, study it
mod_PoV.Hooks.MainMenuScreen_notifyBackendOnShown = MainMenuScreen.prototype.notifyBackendOnShown;
MainMenuScreen.prototype.notifyBackendOnShown = function () {
    this.mOriginalBackgroundUrl = this.mBackgroundImage.attr("src");
    this.updatePOVBackgroundImage(true);
    mod_PoV.Hooks.MainMenuScreen_notifyBackendOnShown.call(this);
}

MainMenuScreen.prototype.updatePOVBackgroundImage = function (_isShow) {
    if (_isShow) {
        this.mBackgroundImage.attr("src", Path.GFX + "ui/screens/pov_title.png");
    } else if (this.mOriginalBackgroundUrl !== null && this.mOriginalBackgroundUrl !== undefined) {
        this.mBackgroundImage.attr("src", this.mOriginalBackgroundUrl);
    }
}

// I need bot this and the func below on MainMenuModule, cause screen is the one that comms with module...
MainMenuScreen.prototype.updatePOVLogoImage = function (_isShow)
{
    if (this.mMainMenuModule !== null &&
        this.mMainMenuModule !== undefined &&
        this.mMainMenuModule.updatePOVLogoImage !== undefined)
    {
        this.mMainMenuModule.updatePOVLogoImage(_isShow);
    }
};

IngameMenuScreen.prototype.updatePOVLogoImage = function (_isShow)
{
    if (this.mMainMenuModule !== null &&
        this.mMainMenuModule !== undefined &&
        this.mMainMenuModule.updatePOVLogoImage !== undefined)
    {
        this.mMainMenuModule.updatePOVLogoImage(_isShow);
    }
};

// Logo in main menu
mod_PoV.Hooks.MainMenuModule_createDIV = MainMenuModule.prototype.createDIV;
MainMenuModule.prototype.createDIV = function (_parentDiv)
{
    mod_PoV.Hooks.MainMenuModule_createDIV.call(this, _parentDiv);

    this.mLogoImage = this.mContainer.find('.header img');
    this.mOriginalLogoUrl = this.mLogoImage.attr('src');
    //this.mLogoImage.attr('src', Path.GFX + 'ui/skin/pov_main_menu_logo.png');
    //this.mLogoImage.css('transform', 'translateY(-40px)');
    this.updatePOVLogoImage(true);
    //mod_PoV.Hooks.MainMenuScreen_notifyBackendOnShown.call(this);
}

// Logo in-game
/*mod_PoV.Hooks.MainMenuModule_createWorldMapMenuButtons = MainMenuModule.prototype.createWorldMapMenuButtons;
MainMenuModule.prototype.createWorldMapMenuButtons = function (_isSavingAllowed)
{
    mod_PoV.Hooks.MainMenuModule_createWorldMapMenuButtons.call(this, _isSavingAllowed);

    this.mLogoImage = this.mContainer.find('.header img');
    this.mOriginalLogoUrl = this.mLogoImage.attr('src');

    this.updatePOVLogoImage(false);
};*/

MainMenuModule.prototype.updatePOVLogoImage = function (_isShow) {
    if (_isShow) {
        this.mLogoImage.attr('src', Path.GFX + 'ui/skin/pov_main_menu_logo.png');
        this.mLogoImage.css('transform', 'translateY(-40px)');
    } else if (this.mOriginalLogoUrl !== null && this.mOriginalLogoUrl !== undefined) {
        this.mLogoImage.attr("src", this.mOriginalLogoUrl);
        this.mLogoImage.css('transform', '');
    }
}


// Old Shet
/*mod_PoV.Hooks.MainMenuScreen_show = MainMenuScreen.prototype.show;
MainMenuScreen.prototype.show = function (_animate)
{
	mod_PoV.Hooks.MainMenuScreen_show.call(this, _animate);
    this.mBackgroundImage.attr("src", Path.GFX + "ui/screens/pov_title.png");
}*/
 

// Function I'm Hooking

/*MainMenuScreen.prototype.show = function (_animate) {
  this.mMainMenuModule.showMainMenu(false);

  var bg = ["08", "09", "10", "11"];

  this.mBackgroundImage.attr("src", Path.GFX + "ui/screens/rotu_title.png");
  this.mContainer.removeClass("display-none").addClass("display-block");

  if (_animate) {
    /*this.mBackgroundImage.velocity("finish", true).velocity({ scaleX: 1.3, scaleY: 1.3, translateX: 200.0, translateY: 50.0 },
		{
			duration: 0
		}).velocity("finish", true).velocity({ scaleX: 1.0, scaleY: 1.0, translateX: 0.0, translateY: 0.0 },
		{
			duration: 25000,
			easing: 'ease-out'
		});
  }

  this.notifyBackendOnShown();
};*/
