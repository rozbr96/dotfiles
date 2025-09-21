{ pkgs, ... }:

let
  dotfiles = ../..;
in
{
  home = {
    username = "hikari";
    homeDirectory = "/home/hikari";
    sessionPath = [ "$HOME/.local/bin" ];
    stateVersion = "25.05";

    file = {
      ".config/eww".source = "${dotfiles}/.config/eww";
      ".config/hypr".source = "${dotfiles}/.config/hypr";
      ".config/kitty".source = "${dotfiles}/.config/kitty";
      ".config/mako".source = "${dotfiles}/.config/mako";
      ".config/nvim".source = "${dotfiles}/.config/nvim";
      ".config/ranger/commands.py".source = "${dotfiles}/.config/ranger/commands.py";
      ".config/ranger/commands_full.py".source = "${dotfiles}/.config/ranger/commands_full.py";
      ".config/ranger/rc.conf".source = "${dotfiles}/.config/ranger/rc.conf";
      ".config/ranger/rifle.conf".source = "${dotfiles}/.config/ranger/rifle.conf";
      ".config/ranger/scope.sh".source = "${dotfiles}/.config/ranger/scope.sh";
      ".config/wofi".source = "${dotfiles}/.config/wofi";
      ".gitconfig".source = "${dotfiles}/.gitconfig";
      ".local/bin".source = "${dotfiles}/.local/bin";
      ".ssh/config".source = "${dotfiles}/.ssh/config";
    };

    packages = with pkgs; [
      fd
      fzf
      kitty
      neovim
      ripgrep
    ];

    sessionVariables = {
      LIBHY3_PATH = "${pkgs.hyprlandPlugins.hy3}/lib/libhy3.so";
    };
  };

  programs ={
    zsh = {
      enable = true;

      enableAutosuggestions = true;

      syntaxHighlighting.enable = true;

      shellAliases = {
        g = "git";
        gs = "g s";
      };

      oh-my-zsh = {
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
        theme = "muse";
      };

      initExtra = ''
        # . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
        # fpath=(${pkgs.asdf-vm}/share/asdf-vm/completions $fpath)
        autoload -Uz compinit && compinit

        setopt AUTO_CD
        setopt AUTO_PUSHD
        setopt CD_SILENT
        setopt CORRECT
        setopt HIST_IGNORE_DUPS
        setopt PUSHD_IGNORE_DUPS
        setopt SHARE_HISTORY
        setopt HIST_FCNTL_LOCK

        if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
          . "$HOME/.nix-profile/etc/profile.d/nix.sh"
        fi
      '';
    };
  };
}
