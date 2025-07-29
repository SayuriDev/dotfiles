{lib, # FIXME: wallpaper does not show
config, 
...}: {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file:///home/sayu/dotfiles/modules/home-manager/desktop/gnome/wallpaper/wallpaper.png";
    };
   };
  }