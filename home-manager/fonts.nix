{ pkgs, ... }:

{
  home.packages = with pkgs; 
  [
    nerd-font-patcher
    noto-fonts-color-emoji
    hack-font
    inter
    corefonts
    wineWow64Packages.fonts
    google-fonts
    noto-fonts
  ];
  
  fonts.fontconfig.enable = true;
}