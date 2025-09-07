{pkgs, ...}:
{
  fonts.packages = with pkgs; [
    nerd-font-patcher
    noto-fonts-color-emoji
    hack-font
    inter
    corefonts
    wineWow64Packages.fonts
    google-fonts
    noto-fonts
    roboto
    font-awesome
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  fonts.fontDir.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true;
}