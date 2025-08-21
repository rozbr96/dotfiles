{
  description = "NixOS configuration for Helios";

  inputs = {
    nixpks.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = {nixpkgs, ...}:
    let
      system = "x86_64-linux";
    in {
      nixosConfiguration.Helios = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
        ];
      };
    };
}
