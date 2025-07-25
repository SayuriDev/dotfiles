{ inputs, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
   

 "$mod" = "SUPER";
 bind = [
   "$mod, R, exec, firefox"
   "$mod, Q, exec, kitty"
   "$mod_SHIFT, Q, killactive"
 ];

 monitor = ", 1920x1080@144, auto, 1";










    };
  };
}