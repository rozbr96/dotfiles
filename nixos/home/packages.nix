{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asdf-vm
    cliphist
    curl
    eww
    fd
    fzf
    gawk
    gcc
    git
    gnumake
    grim
    hyprlandPlugins.hy3
    ijq
    jq
    kitty
    libnotify
    mako
    networkmanagerapplet
    nixd
    powerline
    ranger
    ripgrep
    slurp
    socat
    unzip
    waybar
    wget
    wl-clipboard
    wofi
    xdg-user-dirs
    xdg-utils
    zsh
  ];
}
