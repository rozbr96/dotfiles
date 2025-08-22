
apply_system_configs:
	@sudo nixos-rebuild switch --flake .#Helios

apply_user_configs:
	@nix run .#homeConfigurations.hikari.activationPackage
