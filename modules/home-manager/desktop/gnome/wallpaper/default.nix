{lib, # FIXME: wallpaper does not show
config, 
...}: {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/sayu/dotfiles/modules/home-manager/desktop/gnome/wallpaper.png";
    };
   };
  }