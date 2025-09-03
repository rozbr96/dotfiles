{
  description = "NixOS configuration for Helios";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, home-manager, ...}:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations = {
        Helios = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/helios/system.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        hikari = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [ ./home/hikari.nix ];
        };
      };
    };
}
