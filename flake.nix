{
  description = "Rosemilson's dotfiles and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland/v0.55.0";

    hy3 = {
      url = "github:outfoxxed/hy3/8f56e6ea73db758152b117d507197c46c629afa8";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        Helios = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit inputs; };

          modules = [
            ./nixos/hosts/helios/system.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs;
                };

                users.hikari = import ./nixos/home/hikari.nix;
              };
            }
          ];
        };
      };
    };
}
