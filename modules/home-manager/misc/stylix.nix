{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  # Stylix config
  config = {
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";

      fonts = {
        serif = {
          package = pkgs.ibm-plex;
          name = "IBM Plex Serif";
        };

        sansSerif = {
          package = pkgs.ibm-plex;
          name = "IBM Plex Sans";
        };

        monospace = {
          package = pkgs.ibm-plex;
          name = "IBM Plex Mono";
        };
      };

      # handled by kde
      # image = config.vars.wallpaper;

      base16Scheme = config.vars.base16Scheme;

      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      targets = {
        kde.enable = false;
        qt.platform = "qtct";
      };
    };
  };
}
