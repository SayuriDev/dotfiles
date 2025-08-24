{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05"; 

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = { 
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixcord.url = "github:kaylorben/nixcord";

    nix-colorizer.url = "github:nutsalhan87/nix-colorizer";

    nix-flatpak.url = "github:gmodena/nix-flatpak/";


  };

  outputs = { self, nixpkgs, home-manager, stylix, nur, nix-colorizer, nix-flatpak, nixpkgs-stable, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./modules/nixos/common
            ./vars
            stylix.nixosModules.stylix
            nur.modules.nixos.default
            nur.legacyPackages."${system}".repos.iopq.modules.xraya
            nix-flatpak.nixosModules.nix-flatpak
            
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.extraSpecialArgs = { inherit inputs outputs nix-colorizer pkgs-stable; };
              home-manager.users."sayu" = {
                imports = [
                  ./modules/home-manager/common
                  ./vars
                  inputs.nixcord.homeModules.nixcord
                  inputs.spicetify-nix.homeManagerModules.default
                  inputs.nixvim.homeModules.nixvim

                ];
              };
            }
          ];
        };
      };
    };
}