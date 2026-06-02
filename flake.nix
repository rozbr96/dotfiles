{
  description = "Rosemilson's dotfiles and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland/v0.55.1";

    hy3 = {
      url = "github:outfoxxed/hy3/hl0.55.0";
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
      nix_channel = "26.05";
    in
    {
      nixosConfigurations = {
        Helios = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit inputs nix_channel; };

          modules = [
            ./nixos/hosts/helios/system.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs nix_channel;
                };

                users.hikari = import ./nixos/home/hikari.nix;
              };
            }
          ];
        };
      };
    };
}
