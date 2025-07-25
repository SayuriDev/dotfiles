{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # You can split up your configuration and import pieces of it here:
    # ./users.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ./networking.nix
    ./sound.nix
    ./fonts.nix
];

  programs.hyprland.enable = true;

  services.dbus.enable = true;


  # Required for Wayland
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  environment.systemPackages = with pkgs; 
  [
    git
    wget
    neovim
    vim
    nix-ld
    home-manager
    gtk3
  ];

  nixpkgs.config.allowUnfree = true;

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;


    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  users.users = {
    sayu = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "input"];
    };
  };

  services.openssh.enable = true;
  programs.nix-ld.enable = true;

  # Bootloader.
  boot.loader.grub.enable = true;
#  boot.loader.grub.device = "/dev/nvme0n1p4";
  boot.loader.grub.useOSProber = true; 
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.devices = [ "nodev" ];  

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };


  # Configure console keymap
  console.keyMap = "pl2";


  system.stateVersion = "24.11"; # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.

  

}
