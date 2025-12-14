{ pkgs, config, ... }:

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
  };

  programs = {
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
        autoload -Uz compinit && compinit

        setopt AUTO_CD
        setopt AUTO_PUSHD
        setopt CD_SILENT
        setopt CORRECT
        setopt HIST_IGNORE_DUPS
        setopt PUSHD_IGNORE_DUPS
        setopt SHARE_HISTORY
        setopt HIST_FCNTL_LOCK

        if [ -n "$DEV_PROMPT" ]; then
          PROMPT="($DEV_PROMPT) $PROMPT"
        fi
      '';
    };
  };

  systemd.user = {
    sessionVariables = {
      PATH = "${config.home.homeDirectory}/.local/bin:/run/current-system/sw/bin:${config.home.profileDirectory}/bin";
    };

    services = {
      eww = {
        Unit = {
          Description = "EWW Daemon";
        };

        Service = {
          Type = "exc";
          ExecStart = "${pkgs.eww}/bin/eww daemon --no-daemonize";
          ExecStartPost = "${pkgs.eww}/bin/eww open main-bar --arg orientation=horizontal --arg monitor=1";
          Restart = "always";
          RestartSec = 1;
        };
      };

      hypr-ipc = {
        Unit = {
          Description = "Hyprland IPC";
        };

        Service = {
          Type = "exec";
          ExecStart = "${config.home.homeDirectory}/.local/bin/hypr_ipc";
          Restart = "always";
          RestartSec = 1;
        };
      };

      volume-monitor = {
        Unit = {
          Description = "Volume Monitor";
        };

        Service = {
          Type = "exec";
          ExecStart = "${config.home.homeDirectory}/.local/bin/volume monitor";
          Restart = "always";
          RestartSec = 1;
        };
      };

      network-monitor = {
        Unit = {
          Description = "Network Monitor";
        };

        Service = {
          Type = "exec";
          ExecStart = "${config.home.homeDirectory}/.local/bin/network monitor";
          Restart = "always";
          RestartSec = 1;
        };
      };
    };
  };
}
