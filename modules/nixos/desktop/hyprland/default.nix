{ inputs, lib, config, pkgs, ... }: 
{
  programs.hyprland.enable = true;
   
   # Required for Wayland
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}