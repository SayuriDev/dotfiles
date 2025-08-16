{lib, ...}:
with lib;
{
  options.vars = {
    wallpaper = mkOption {
      type = types.str;
      default = "${../media/wallpapers/wallpaper.png}";
      description = "My wallpaper";
    };
  };
}
