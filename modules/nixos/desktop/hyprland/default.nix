{ inputs, lib, config, pkgs, ... }: 
{
  
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
   
   # Required for Wayland
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk 
      ];
      config = {
        common.default = "*";
        hyprland = {
          default = ["gtk" "hyprland"];
        };
      };
  };

  # Avoid recompiling deps every time
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
