{...}: {
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
       associations.added = {
         "audio/mpeg" = ["io.mpv.Mpv"];
         "image/jpeg" = ["org.kde.gwenview"];
         "image/jpg" = ["org.kde.gwenview"];
         "image/png" = ["org.kde.gwenview"];
         "video/mp3" = ["io.mpv.Mpv"];
         "video/mp4" = ["io.mpv.Mpv"];
         "video/quicktime" = ["io.mpv.Mpv"];
         "video/webm" = ["io.mpv.Mpv"];
       };
       defaultApplications = {
      #   "application/json" = ["gnome-text-editor.desktop"];
      #   "application/toml" = ["org.gnome.TextEditor.desktop"];
         "audio/*" = ["io.mpv.Mpv"];
         "audio/mp3" = ["io.mpv.Mpv"];
         "image/*" = ["org.kde.gwenview"];
         "image/jpg" = ["org.kde.gwenview"];
         "image/png" = ["org.kde.gwenview"];
      #   "text/plain" = "org.gnome.TextEditor.desktop";
         "video/*" = ["io.mpv.Mpv"];
         "video/mp4" = ["io.mpv.Mpv"];
       };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}