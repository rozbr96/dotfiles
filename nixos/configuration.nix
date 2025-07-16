
{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
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
      asdf-vm
      busybox
      cliphist
      curl
      docker
      docker-compose
      eww
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
      mako
      neovim
      networkmanagerapplet
      nixd
      powerline
      ranger
      sddm-chili-theme
      slurp
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

    nix-ld.enable = true;

    thefuck.enable = true;

    zsh = {
      autosuggestions.enable = true;
      enable = true;
      enableBashCompletion = true;
      interactiveShellInit = ''
        . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
        fpath=(${pkgs.asdf-vm}/share/asdf-vm/completions $fpath)
        autoload -Uz compinit && compinit
      '';
      ohMyZsh = {
        enable = true;
        plugins = [
          "branch"
          "bundler"
          "colored-man-pages"
          "command-not-found"
          "copyfile"
          "copypath"
          "docker"
          "docker-compose"
          "emoji"
          "gem"
          "gitignore"
          "history-substring-search"
          "ssh"
          "sudo"
          "themes"
          "wd"
          "zsh-interactive-cd"
          "zsh-navigation-tools"
        ];
        theme = "philips";
      };
      setOptions = [
        "AUTO_CD"
        "AUTO_PUSHD"
        "CD_SILENT"
        "CORRECT"
        "HIST_IGNORE_DUPS"
        "PUSHD_IGNORE_DUPS"
        "SHARE_HISTORY"
        "HIST_FCNTL_LOCK"
      ];
      shellAliases = {
        g = "git";
        gs = "g s";
      };
      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "cursor"
          "regexp"
          "root"
          "line"
        ];
      };
    };
  };

  security = {
    polkit.enable = true;
  };

  services = {
    dbus.enable = true;

    displayManager = {
      defaultSession = "hyprland";

      sddm = {
        enable = true;
        theme = "chili";
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

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  system = {
    copySystemConfiguration = true;
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

