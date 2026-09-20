{ ... }:
{
  imports = [
    ./nh.nix
    ./polkit.nix
    ./flatpak.nix
    ./keyd.nix
    ./power-profiles.nix
    ./udev.nix
    ./smartd.nix
  ];
}
