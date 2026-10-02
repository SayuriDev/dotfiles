{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ../programs
    ../misc
    ../desktop
    ../services/clipse.nix
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Home-Manager configuration for the user's home environment
  home = {
    username = config.vars.username;
    homeDirectory = "/home/${config.vars.username}";
  };

  # Ensure common packages are installed
  home.packages = with pkgs; [
    playerctl
    mpv
    pavucontrol

    fastfetch
    tree
    nix-search-cli

    gparted
    kdePackages.ark
    libarchive
    _7zz
    unzip
    unrar

    libreoffice
    foliate

    krita
    gimp
    obs-studio
    kdePackages.gwenview

    teams-for-linux

    freecad
  ];

  home.sessionVariables = {
    PICO_SDK_PATH = "${pkgs.pico-sdk}/lib/pico-sdk";
  };
  home.stateVersion = "24.11"; # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.

}
