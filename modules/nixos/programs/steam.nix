{
  lib,
  config,
  pkgs,
  ...
}:
{
    programs.steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            pkgs.proton-ge-bin
          ];     
       };
    };

    programs.gamemode.enable = true;
}