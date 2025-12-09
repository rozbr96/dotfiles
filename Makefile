IS_NIXOS := $(shell grep -q "NixOS" /etc/os-release && echo 1 || echo 0)

system:
ifeq ($(IS_NIXOS),1)
	@sudo nixos-rebuild switch --flake .#Helios
else
	@echo "⚠️ Skipping system configs: not on NixOS"
endif

flake_update:
	@nix flake update

upgrade: flake_update system

hypr:
	@hyprctl reload

all: system hypr
