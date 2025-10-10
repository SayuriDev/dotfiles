{lib, ...}:
with lib;
{
  options.vars = {
    wallpaper = mkOption {
      type = types.str;
      default = "${../assets/wallpapers/wallpaper.png}";
      description = "My wallpaper";
    };
  };
    options.vars = {
    profile = mkOption {
      type = types.str;
      default = "${../assets/profile.png}";
      description = "My profile picture";
    };
  };
}
