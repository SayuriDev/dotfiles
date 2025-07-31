{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
#    catppuccin.gtk.enable = true;
#    catppuccin.enable = true;
#   # Catpuccin flavor and accent
  catppuccin = {
    flavor = "mocha";
    accent = "lavender";
    enable = true; # Enable Catppuccin theme
    gtk.enable = true; # Enable GTK theme
  };



    gtk = {
        enable = true;
        iconTheme = {
            name = "Tela-dark";
            package = pkgs.tela-icon-theme;
        };
        # cursorTheme = {
        #     name = "Bibata-Modern-Classic";
        #     package = pkgs.bibata-cursors;
        #     size = 24; # Default cursor size
        # };
        # font = {
        #     name = "Inter";
        #     size = 11; # Default font size
        # };
        gtk3 = {
            bookmarks = [
                file:///home/sayu/Documents
                file:///home/sayu/Downloads
                file:///home/sayu/Pictures
                file:///home/sayu/Videos
            ];
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


}