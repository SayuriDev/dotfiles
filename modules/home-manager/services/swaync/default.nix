{pkgs, ...}: {

  home.packages = [
    pkgs.swaynotificationcenter
  ];

  # Source swaync config from the home-manager store
  xdg.configFile = {
    "swaync/style.css" = {
      source = ./style.css;
    };
  };
}