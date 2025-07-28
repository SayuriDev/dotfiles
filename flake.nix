{
  description = "My NixOS configuration"; 

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";


};

  outputs = { self, nixpkgs, home-manager, ...} @ inputs: let
    inherit (self) outputs;
    system = inputs.nixpkgs.system or "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs; };
        # > Our main nixos configuration file <
        modules = [
          ./modules/nixos/common/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.sayu = import ./modules/home-manager/common {
              inherit inputs pkgs;
              lib = pkgs.lib;
              config = { };
            };
          }
        ];
      };
    };

  };
}