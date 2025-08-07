{ pkgs, inputs, config, lib, ... }:
let
  # Remove "#" before hex colors
  stripHash = color: builtins.replaceStrings ["#"] [""] color;
  stylixColor = config.stylix.base16Scheme;
  noHash = builtins.mapAttrs (_: colorValue: stripHash colorValue) stylixColor;
in {
  # Declare noHash option
  options.stylix.noHash = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    description = "Stylix base16 without hashtags";
    readOnly = true;
  };

  # Stylix config
  config = {
    stylix.noHash = noHash;

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

      targets.waybar.enable = false;
      targets.swaync.enable = false;
      targets.zen-browser.profileNames = ["default"];
  

      base16Scheme = {
        base00 = "#1e1e2e"; # base
        base01 = "#181825"; # mantle
        base02 = "#313244"; # surface0
        base03 = "#45475a"; # surface1
        base04 = "#585b70"; # surface2
        base05 = "#cdd6f4"; # text
        base06 = "#f5e0dc"; # rosewater
        base07 = "#b4befe"; # lavender
        base08 = "#f38ba8"; # red
        base09 = "#fab387"; # peach
        base0A = "#f9e2af"; # yellow
        base0B = "#a6e3a1"; # green
        base0C = "#94e2d5"; # teal
        base0D = "#89b4fa"; # blue
        base0E = "#cba6f7"; # mauve
        base0F = "#f2cdcd"; # flamingo
      };

      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };
    };

  };
}
