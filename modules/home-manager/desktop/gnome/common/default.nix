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
  user-themes
  ] ++ (with pkgs; [
  gnome-tweaks
  orchis-theme
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
        user-themes.extensionUuid
      ];
    };
    settings."org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba"; 
      font-hinting = "slight";
      gtk-enable-primary-paste = false;
      document-font-name = "Roboto 11";
      monospace-font-name = "JetBrains Mono 11";

    };
  #  settings."org/gnome/shell/favorite-apps" = []
      # "org.gnome.Nautilus.desktop" # FIXME: doesnt work
      # "org.gnome.Terminal.desktop"
      # "org.gnome.TextEditor.desktop"
      # "org.gnome.Software.desktop"
      # "org.gnome.Calculator.desktop"
      # "org.gnome.Calendar.desktop"
      # "org.gnome.Documents.desktop"
      # "org.gnome.Photos.desktop"
    #];
    settings."org/gnome/shell/extensions/just-perfection" = {
         quick-settings-dark-mode = false;
         quick-settings-airplane-mode = false;
         switcher-popup-delay = false;
    };
    settings."org/gnome/shell/extensions/dash-to-dock" = {
      click-action = "focus-minimize-or-previews";
      shift-click-action = "launch";
      apply-custom-theme = true;
      hot-keys = false;
      show-show-apps-button = false;
      show-trash = false;
  };
    settings."org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      style-dialags = 1;
    };
    settings."org/gnome/desktop/notifications/application/spotify" = { enable = false; };
  };
}

# dconf watch /