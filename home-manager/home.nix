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
    ./fonts.nix
    ./kitty.nix
    ./quickshell/quickshell.nix
  ];
  
  home = {
    username = "sayu";
    homeDirectory = "/home/sayu";

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      };
    };

  

   programs.neovim.enable = true;
   home.packages = with pkgs; 
    [ 
      firefox
      neofetch
      waybar
      kitty
    ];


  

  programs.home-manager.enable = true;
  programs.git.enable = true;


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";


  home.stateVersion = "24.11"; # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.
}