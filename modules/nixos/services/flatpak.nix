{...}:
{
  services.flatpak = {
    enable = true;
    update.onActivation = true; # update pkgs with nixos switch

    packages = [
      "com.usebottles.bottles"
      "com.heroicgameslauncher.hgl"
      "com.valvesoftware.Steam.VulkanLayer.MangoHud/x86_64/stable"
    ];

    overrides = {
      global = {
        Context.sockets = ["wayland" "!x11" "!fallback-x11"];

        Environment = {
          # Fix un-themed cursor in some Wayland apps
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

        };
      };
    };
  };
}