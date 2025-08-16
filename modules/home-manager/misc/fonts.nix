{pkgs, ...}: {
  
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
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
    nerd-fonts.space-mono
    nerd-fonts.jetbrains-mono
  ];

}