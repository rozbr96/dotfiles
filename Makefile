IS_NIXOS := $(shell grep -q "NixOS" /etc/os-release && echo 1 || echo 0)

user:
	@nix run --extra-experimental-features nix-command --extra-experimental-features flakes .#homeConfigurations.hikari.activationPackage
	@make hypr

system:
ifeq ($(IS_NIXOS),1)
	@sudo nixos-rebuild switch --flake .#Helios
else
	@echo "⚠️ Skipping system configs: not on NixOS"
endif

hypr:
	@hyprctl reload

all: system user
