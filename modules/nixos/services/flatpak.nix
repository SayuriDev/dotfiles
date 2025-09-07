{...}:
{
  services.flatpak = {
    enable = true;
    update.onActivation = true; # update pkgs with nixos switch

    packages = [
      "com.usebottles.bottles"
      "com.heroicgameslauncher.hgl"
    ];
  };
}