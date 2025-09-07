{ pkgs, inputs, config, lib, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    # opacity = {  # doesnt work on hyprland. yet? 
    #   terminal = 0.9;
    #   popups = 0.9;
    #   desktop = 0.9;
    #   applications = 0.9;
    # };

    base16Scheme = config.vars.base16Scheme;
    
    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    image = config.vars.wallpaper;
  };
  
}