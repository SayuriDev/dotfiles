{ pkgs, ... }:

{
  # Fonts
  environment.systemPackages = with pkgs; 
  [
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
