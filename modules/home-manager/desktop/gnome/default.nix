{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
        forge.extensionUuid
        space-bar.extensionUuid
        blur-my-shell.extensionUuid
        just-perfection.extensionUuid
        dash-to-dock.extensionUuid
      ];
    };
  };
}