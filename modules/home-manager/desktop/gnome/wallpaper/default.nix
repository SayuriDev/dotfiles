{lib, # FIXME: wallpaper does not show
config, 
...}: {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-url = "file://./wallpaper.png";
      picture-options = " 'zoom' ";
    };
   };
  }