{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking.hostName = "Raspbian";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  users.users.rasp = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "rasp";
    packages = with pkgs; [
      i3
    ];
  };

  services = {
    openssh.enable = true;

    displayManager = {
      autoLogin = {
        enable = true;
        user = "rasp";
      };

      defaultSession = "none+i3";
    };

    xserver = {
      enable = true;
      desktopManager.xterm.enable = false;
      windowManager.i3.enable = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "26.11";
}
