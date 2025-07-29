{ config, ... }:

let
  bgPath = "file://${config.home.homeDirectory}/dotfiles/modules/home-manager/desktop/gnome/wallpaper/wallpaper.png";
in {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = bgPath;
      picture-uri-dark = bgPath;
    };
  };
}
