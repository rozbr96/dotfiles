{
  description = "Rosemilson's dotfiles and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        Helios = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./nixos/hosts/helios/system.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        hikari = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./nixos/home/hikari.nix
          ];
        };
      };
    };
}
