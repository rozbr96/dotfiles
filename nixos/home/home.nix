let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/rozbr96/dotfiles.git";
    rev = "bef88122d87356d8f4882b926b6fb6e7d77b5351";
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
