let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/rozbr96/dotfiles.git";
    rev = "9d5db4c7446aafe07f39c089d5bcdee28ecabd84";
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
