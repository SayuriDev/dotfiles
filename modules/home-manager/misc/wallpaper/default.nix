{lib, ...}: {
  options.wallpaper = lib.mkOption {
    type = lib.types.path;
    default = ./wallpaper.png;
    readOnly = true;
    description = "Wallpaper :3";
  };
}