{ ... }:

let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/rozbr96/dotfiles.git";
    rev = "f738023c6c3249f05b5207e2f5b5893c4b689f02";
  };
in
{
  home.username = "hikari";
  home.homeDirectory = "/home/hikari";

  home.file.".config/eww".source = "${dotfiles}/.config/eww";
  home.file.".config/hypr".source = "${dotfiles}/.config/hypr";
  home.file.".config/kitty".source = "${dotfiles}/.config/kitty";
  home.file.".config/mako".source = "${dotfiles}/.config/mako";
  home.file.".config/nixpkgs".source = "${dotfiles}/.config/nixpkgs";
  home.file.".config/nvim".source = "${dotfiles}/.config/nvim";
  home.file.".config/ranger".source = "${dotfiles}/.config/ranger";
  home.file.".config/wofi".source = "${dotfiles}/.config/wofi";

  imports = [
    ./zsh.nix
    ./nvim.nix
    ./git.nix
    ./packages.nix
    ./fonts.nix
  ];

  home.stateVersion = "25.05";
}
