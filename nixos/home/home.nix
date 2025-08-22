let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/rozbr96/dotfiles.git";
    rev = "f738023c6c3249f05b5207e2f5b5893c4b689f02";
  };
in
{
  home.username = "hikari";
  home.homeDirectory = "/home/hikari";

  home.file.".config/kitty".source = "${dotfiles}/.config/kitty";
  home.file.".config/nvim".source = "${dotfiles}/.config/nvim";
  home.file.".local/bin".source = "${dotfiles}/.local/bin";

  imports = [
    ./git.nix
    ./fonts.nix
    ./nvim.nix
    ./zsh.nix
  ];

  home.sessionPath = [ "$HOME/.local/bin" ];

  home.stateVersion = "25.05";
}
