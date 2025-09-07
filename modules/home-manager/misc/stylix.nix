{ pkgs, inputs, config, lib, ... }:
{
  # Stylix config
  config = {
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      image = config.vars.wallpaper;
      base16Scheme = config.vars.base16Scheme;
      
      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      targets = {
        waybar.enable = false;
        gtk.flatpakSupport.enable = false;
        swaync.enable = false;
      };
    };
  };
}
