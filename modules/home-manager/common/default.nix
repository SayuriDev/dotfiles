{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ../desktop/gnome/common
    ../services/nh
    ../misc/gtk

  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Home-Manager configuration for the user's home environment
  home = {
    username = "sayu";
    homeDirectory = "/home/sayu";
  };

  # Ensure common packages are installed
  home.packages = with pkgs;
    [
      anki-bin
      nh

    ];



  home.stateVersion = "24.11"; # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.

}