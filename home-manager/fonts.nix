{ pkgs, ... }:

{
  # Fonts
  home.packages = with pkgs; 
  [
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
