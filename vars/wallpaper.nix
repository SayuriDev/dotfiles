{ lib, ... }:
with lib;
{
  options.vars = {
    wallpaper = mkOption {
      type = types.str;
      default = "${../assets/wallpapers/wallpaper.png}";
      description = "My wallpaper";
    };
  };
}
