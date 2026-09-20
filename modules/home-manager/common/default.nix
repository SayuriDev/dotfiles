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
    username = "sayu";
    homeDirectory = "/home/sayu";
  };

  # Ensure common packages are installed
  home.packages = with pkgs; [
    fastfetch
    libreoffice
    unzip
    unrar
    pavucontrol
    playerctl
    kdePackages.gwenview
    mpv
    gparted
    nix-search-cli
    libarchive
    tree
    yazi
    foliate
    osu-lazer-bin
    krita
    kdePackages.ark
    teams-for-linux
  ];

  home.stateVersion = "24.11"; # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.

}
