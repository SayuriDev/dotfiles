{...}:
{
  services.flatpak = {
    enable = true;
    update.onActivation = true; # update pkgs with nixos switch

    # overrides.global = { Context.sockets = ["wayland" "!x11" "!fallback-x11"]; }; # force wayland
    packages = [
      "com.usebottles.bottles"
    ];
  };
}