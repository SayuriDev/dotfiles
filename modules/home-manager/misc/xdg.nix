{ ... }:
{
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;

      defaultApplications = {
        "application/zip"             = [ "org.kde.ark.desktop" ];
        "application/x-tar"           = [ "org.kde.ark.desktop" ];
        "application/x-7z-compressed" = [ "org.kde.ark.desktop" ];
        "application/x-rar"           = [ "org.kde.ark.desktop" ];
        "application/vnd.rar"         = [ "org.kde.ark.desktop" ];
        "application/x-bzip2"         = [ "org.kde.ark.desktop" ];
        "application/x-gzip"          = [ "org.kde.ark.desktop" ];
        "application/x-xz"            = [ "org.kde.ark.desktop" ];

        "audio/mpeg"   = [ "io.mpv.Mpv.desktop" ]; # mp3
        "audio/mp4"    = [ "io.mpv.Mpv.desktop" ]; # m4a
        "audio/x-wav"  = [ "io.mpv.Mpv.desktop" ]; # wav
        "audio/flac"   = [ "io.mpv.Mpv.desktop" ];
        "audio/ogg"    = [ "io.mpv.Mpv.desktop" ];
        "audio/x-opus+ogg" = [ "io.mpv.Mpv.desktop" ];

        "video/mp4"        = [ "io.mpv.Mpv.desktop" ];
        "video/webm"       = [ "io.mpv.Mpv.desktop" ];
        "video/x-matroska" = [ "io.mpv.Mpv.desktop" ]; # mkv
        "video/quicktime"  = [ "io.mpv.Mpv.desktop" ];
        "video/x-msvideo"  = [ "io.mpv.Mpv.desktop" ]; # avi
        "video/x-flv"      = [ "io.mpv.Mpv.desktop" ];

        "image/jpeg" = [ "org.kde.gwenview.desktop" ];
        "image/png"  = [ "org.kde.gwenview.desktop" ];
        "image/gif"  = [ "org.kde.gwenview.desktop" ];
        "image/webp" = [ "org.kde.gwenview.desktop" ];
        "image/svg+xml" = [ "org.kde.gwenview.desktop" ];
        "image/tiff" = [ "org.kde.gwenview.desktop" ];
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
