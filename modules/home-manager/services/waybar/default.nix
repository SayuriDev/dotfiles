{config, ...}: {
  # Install and configure waybar via home-manager module
  programs.waybar = {
    enable = true;
  };
  home.file = {
  ".config/waybar/style.css".source = ./style.css;
  ".config/waybar/config.jsonc".source = ./config.jsonc;
  ".config/waybar/modules.json".source = ./modules.json;
  };
}