# home.nix

# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./hyprland.nix
    # ./services.nix
    ./sound.nix
    ./fonts.nix
    ./waybar.nix
    ./kitty.nix
  ];
  
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "sayu";
    homeDirectory = "/home/sayu";
  };

   programs.neovim.enable = true;
   home.packages = with pkgs; 
    [ 
      brave
      neofetch
      parsec-bin
    ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";


  home.stateVersion = "24.11"; # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.
}