IS_NIXOS := $(shell grep -q "NixOS" /etc/os-release && echo 1 || echo 0)

apply_system_configs:
ifeq ($(IS_NIXOS),1)
	@sudo nixos-rebuild switch --flake .#Helios
else
	@echo "⚠️ Skipping system configs: not on NixOS"
endif

apply_user_configs:
	@nix run --extra-experimental-features nix-command --extra-experimental-features flakes .#homeConfigurations.hikari.activationPackage
	@make apply_hypr_configs

apply_hypr_configs:
	@hyprctl reload

all: apply_system_configs apply_user_configs
