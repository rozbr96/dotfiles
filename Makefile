IS_NIXOS := $(shell grep -q "NixOS" /etc/os-release && echo 1 || echo 0)

RASPBIAN_USER := rasp
RASPBIAN_IP := 10.3.152.18
RASPBIAN_ADDR := $(RASPBIAN_USER)@$(RASPBIAN_IP)

helios:
ifeq ($(IS_NIXOS),1)
	@sudo nixos-rebuild switch --flake .#Helios
else
	@echo "⚠️ Skipping system configs: not on NixOS"
endif

raspbian:
	@nixos-rebuild switch --flake .#Raspbian --target-host $(RASPBIAN_ADDR) --build-host $(RASPBIAN_ADDR) --sudo

flake_update:
	@nix flake update

upgrade: flake_update system

hypr:
	@hyprctl reload

