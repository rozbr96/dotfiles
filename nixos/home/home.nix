let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/rozbr96/dotfiles.git";
    rev = "0186223df047b81eb2b83efe79804a66b495206b";
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
