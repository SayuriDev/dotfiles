{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, home-manager, stylix, nur, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./modules/nixos/common
            stylix.nixosModules.stylix
            nur.modules.nixos.default
            nur.legacyPackages."${system}".repos.iopq.modules.xraya
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.extraSpecialArgs = { inherit inputs outputs; };
              home-manager.users."sayu" = {
                imports = [
                  ./modules/home-manager/common
                  stylix.homeModules.stylix
                  
                  inputs.spicetify-nix.homeManagerModules.default

                ];
              };
            }
          ];
        };
      };
    };
}