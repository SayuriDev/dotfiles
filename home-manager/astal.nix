{ pkgs, ... }:

let
  tomlFormat = pkgs.formats.toml { };
in {
  home.packages = [ pkgs.astal.astal4 ];
  
  xdg.configFile."astal/config.toml".source = tomlFormat.generate "astal-config" {
    bar = {
      height = 35;
      background = "#1e1e2e";
      foreground = "#cdd6f4";
    };
    modules = {
      left = {
        type = "clock";
        format = "%H:%M";
      };
      center = {
        type = "hyprland/workspaces";
      };
    };
  };
}