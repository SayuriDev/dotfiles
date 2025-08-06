{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ 
    hyprpaper
    hyprshot
    ];

  imports = [
    ../misc/wallpaper
    ../programs/wofi
    ../services/cliphist
    ../services/waybar

  ];

  # Consistent cursor theme across all applications.
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   x11.enable = true;
  #   package = pkgs.yaru-theme;
  #   name = "Yaru";
  #   size = 24;
  # };

  # Source hyprland config from the home-manager store
  xdg.configFile = {
    "hypr/hyprland.conf" = {
      source = ./hyprland.conf;
    };

    "hypr/hyprpaper.conf".text = ''
      splash = false
      preload = ${config.wallpaper}
      wallpaper = , ${config.wallpaper}
    '';

    # "hypr/hypridle.conf".text = ''
    #   general {
    #     lock_cmd = pidof hyprlock || dynamic-hyprlock
    #     before_sleep_cmd = loginctl lock-session
    #     after_sleep_cmd = hyprctl dispatch dpms on
    #   }
    # '';
  };
}