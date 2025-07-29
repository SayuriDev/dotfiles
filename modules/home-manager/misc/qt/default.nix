{
  lib,
  pkgs,
  ...
}: {
    qt = {
      enable = true;
      platformTheme.name = "kvantum";
      style.name = "kvantum";
    };
    catppuccin.kvantum.enable = true;
    catppuccin.kvantum.apply = true;

    home.sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
      DISABLE_QT5_COMPAT = "0";
      CALIBRE_USE_DARK_PALETTE = "1";
    };
  }
