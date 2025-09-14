{ ... }:
{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "audio/mpeg" = [ "io.mpv.Mpv.desktop" ];
        "image/jpeg" = [ "org.kde.gwenview.desktop" ];
        "image/png" = [ "org.kde.gwenview.desktop" ];
        "video/mp3" = [ "io.mpv.Mpv.desktop" ];
        "video/mp4" = [ "io.mpv.Mpv.desktop" ];
        "video/quicktime" = [ "io.mpv.Mpv.desktop" ];
        "video/webm" = [ "io.mpv.Mpv.desktop" ];
      };
      defaultApplications = {
        #   "application/json" = ["gnome-text-editor.desktop"];
        #   "application/toml" = ["org.gnome.TextEditor.desktop"];
        "audio/*" = [ "io.mpv.Mpv.desktop" ];
        "audio/mp3" = [ "io.mpv.Mpv.desktop" ];
        "image/*" = [ "org.kde.gwenview.desktop" ];
        "image/jpeg" = [ "org.kde.gwenview.desktop" ];
        "image/png" = [ "org.kde.gwenview.desktop" ];
        #   "text/plain" = "org.gnome.TextEditor.desktop";
        "video/*" = [ "io.mpv.Mpv.desktop" ];
        "video/mp4" = [ "io.mpv.Mpv.desktop" ];
        "application/zip" = [ "org.kde.ark.desktop" ];
        "application/vnd.rar" = [ "org.kde.ark.desktop" ];
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
