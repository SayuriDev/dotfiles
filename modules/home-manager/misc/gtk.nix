{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24; # Default cursor size
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-enable-animations = true;
      };
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-enable-animations = true;
    };
  };

  xdg.configFile."gtk-3.0/settings.ini".force = true;
  xdg.configFile."gtk-4.0/settings.ini".force = true;

  home.activation.fixGtkConfigs = lib.hm.dag.entryBefore [ "writeBoundary" ] ''
    rm -f "$HOME/.gtkrc-2.0"
    rm -f "$HOME/.config/gtk-3.0/settings.ini"
    rm -f "$HOME/.config/gtk-4.0/settings.ini"
  '';
}
