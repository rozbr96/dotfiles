{
  description = "NixOS configuration for Helios";

  inputs = {
    nixpks.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = {nixpks, ...}:
    let
      system = "x86_64-linux";
    in {
      nixosConfiguration.Helios = nixpks.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
        ];
      };
    };
}
