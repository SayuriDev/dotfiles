{ config, inputs, ... }:
let
  colors = config.vars.base16SchemeNoHash;
in
{
  programs.nixcord = {
    enable = true;
    vesktop = {
      enable = true;
      settings = {
        arRPC = true;
      };
    };
    discord.vencord.enable = true;

    config = {
      useQuickCss = false;
      transparent = false;
      themeLinks = [
        # or use an online theme
        # "https://capnkitten.github.io/BetterDiscord/Themes/Material-Discord/css/source.css"
      ];
      frameless = false;
      plugins = {
        volumeBooster.enable = true;
        ClearURLs.enable = true;
        fixImagesQuality.enable = true;
        iLoveSpam.enable = true;
        imageFilename.enable = true;
        imageZoom.enable = true;
        noF1.enable = true;
        reverseImageSearch.enable = true;
        streamerModeOnStream.enable = true;
        gameActivityToggle.enable = true;
      };
    };
    extraConfig = {
      # Some extra JSON config here
      # ...
    };
  };
}
