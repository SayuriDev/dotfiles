{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../wallpaper
  ];


  home.packages = with pkgs.gnomeExtensions; [
  system-monitor
  blur-my-shell
  gsconnect
  forge
  space-bar
  just-perfection
  dash-to-dock
  ] ++ (with pkgs; [
  gnome-tweaks
  ]);

  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
        forge.extensionUuid
        space-bar.extensionUuid
        just-perfection.extensionUuid
        dash-to-dock.extensionUuid
      ];
    };
    settings."org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba"; 
      font-hinting = "slight";
      gtk-enable-primary-paste = false;
    };
  };
}