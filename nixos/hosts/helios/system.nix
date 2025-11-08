
{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        configurationLimit = 1;
        editor = false;
        enable = true;
      };
      timeout = 10;
    };

    supportedFilesystems = [ "exfat" "ntfs" "vfat" ];
  };

  environment = {
    localBinInPath = true;

    sessionVariables = {
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    systemPackages = with pkgs; [
      btop
      busybox
      cliphist
      curl
      docker
      docker-compose
      eww
      fd
      feh
      fzf
      gawk
      gcc
      git
      gnumake
      google-chrome
      grim
      hyprlandPlugins.hy3
      ijq
      jq
      kitty
      libinput
      libnotify
      libreoffice
      mako
      mpv
      neovim
      networkmanagerapplet
      nixd
      playerctl
      powerline
      ranger
      ripgrep
      sddm-chili-theme
      slurp
      socat
      unzip
      vimPlugins.packer-nvim
      waybar
      wget
      wl-clipboard
      wofi
      xdg-user-dirs
      xdg-utils
      zsh
    ];
  };

  fileSystems = lib.mkForce {
    "/" = {
      device = "/dev/disk/by-label/SYSTEM";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };

  fonts = {
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      google-fonts
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-emoji
      orbitron
      powerline-fonts
    ];
  };

  hardware = {
    bluetooth = {
      enable = true;
    };

    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = true;
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  networking = {
    networkmanager.enable = true;
    hostName = "Helios";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs = {
    config.allowUnfree = true;
  };

  programs = {
    hyprland.enable = true;

    hyprlock.enable = true;

    nix-ld.enable = true;

    zsh.enable = true;
  };

  security = {
    polkit.enable = true;
  };

  services = {
    dbus.enable = true;

    displayManager = {
      defaultSession = "hyprland";

      ly = {
        enable = true;
      };
    };

    libinput.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    printing.enable = true;

    seatd.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  system = {
    stateVersion = "25.05"; # Did you read the comment? yes, I did :)
  };

  time = {
    timeZone = "America/Sao_Paulo";
  };

  users = {
    groups.hikari = {};

    users.hikari = {
      description = "Rosemilson Barbosa";
      extraGroups = [ "docker" "input" "networkmanager" "wheel" ];
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

