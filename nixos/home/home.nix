let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/rozbr96/dotfiles.git";
    rev = "43e1821f417f2a9d493ec58a44f40114422a959e";
  };
in
{
  home = {
    username = "hikari";
    homeDirectory = "/home/hikari";
    sessionPath = [ "$HOME/.local/bin" ];
    stateVersion = "25.05";

    file = {
      ".config/kitty".source = "${dotfiles}/.config/kitty";
      ".config/nvim".source = "${dotfiles}/.config/nvim";
      ".local/bin".source = "${dotfiles}/.local/bin";
    };
  };

  imports = [
    ./git.nix
    ./fonts.nix
    ./nvim.nix
    ./zsh.nix
  ];
}
