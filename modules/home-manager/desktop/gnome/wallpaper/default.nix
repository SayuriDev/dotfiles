{lib, # FIXME: wallpaper does not show
config, 
...}: {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://./wallpaper.png";
    };
   };
  }