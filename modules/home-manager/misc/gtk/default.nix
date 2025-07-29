{pkgs, ...
}: {
    gtk = {
        # enable = true;
        # iconTheme = {
        #     name = "#FIXME:"
        #     package = ;
        # };
        # cursorTheme = {
        #     name = "#FIXME:"
        #     package = ;
        #     size = 24; # Default cursor size
        # };
        font = {
            name = "Roboto";
            size = 11; # Default font size
        };
        gtk3 = {
            bookmarks = [
                file:///home/sayu/Documents
                file:///home/sayu/Downloads
                file:///home/sayu/Pictures
                file:///home/sayu/Videos
            ];
            extraConfig = ''
                gtk-application-prefer-dark-theme = true;
                gtk-enable-animations = true;
              '';
        };

        gtk4.extraConfig = ''
            gtk-application-prefer-dark-theme = true;
            gtk-enable-animations = true;
          '';
    };


   # <theme>.gtk.enable = true; # Enable GTK theme FIXME: 
}