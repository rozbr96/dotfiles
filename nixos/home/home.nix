let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/rozbr96/dotfiles.git";
    rev = "43e1821f417f2a9d493ec58a44f40114422a959e";
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
