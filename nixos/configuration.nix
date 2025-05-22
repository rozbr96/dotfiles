
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    supportedFilesystems = [ "exfat" "ntfs" "vfat" ];
  };

  environment = {
    sessionVariables = {
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    systemPackages = with pkgs; [
      asdf-vm
      curl
      docker
      docker-compose
      gawk
      gcc
      git
      gnumake
      google-chrome
      hyprlandPlugins.hy3
      kitty
      mako
      neovim
      networkmanagerapplet
      powerline
      unzip
      vimPlugins.packer-nvim
      waybar
      wget
      wl-clipboard
      wofi
      xdg-utils
      zsh
    ];
  };

  fonts = {
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      powerline-fonts
    ];
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = true;
    };

    graphics.enable = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  networking = {
    networkmanager.enable = true;
    hostName = "Helios";
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };

  security = {
    polkit.enable = true;
  };

  services = {
    dbus.enable = true;

    displayManager.defaultSession = "hyprland";

    libinput.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    printing.enable = true;

    xserver = {
      enable = true;
      displayManager.gdm.wayland = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  system = {
    activationScripts = {
      systemdBootLoaderEntriesScript = {
        text = ''
          current_loader_entry_file="$(cat /boot/loader/loader.conf | grep ^default | cut -c9-)"

          files=$(ls /boot/loader/entries -I $current_loader_entry_file)

          cd /boot/loader/entries

          [[ ! -z $files ]] && rm $files
        '';
      };
    };

    copySystemConfiguration = true;

    stateVersion = "24.11"; # Did you read the comment? yes, I did :)
  };

  time = {
    timeZone = "America/Sao_Paulo";
  };

  users = {
    groups.hikari = {};

    users.hikari = {
      description = "Rosemilson Barbosa";
      extraGroups = [ "docker" "networkmanager" "wheel" ];
      group = "hikari";
      initialPassword = "password";
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };

  virtualisation = {
    docker.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}

