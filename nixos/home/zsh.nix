{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
    fzf
    ripgrep
  ];

  programs.zsh = {
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
      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
      fpath=(${pkgs.asdf-vm}/share/asdf-vm/completions $fpath)
      autoload -Uz compinit && compinit

      setopt AUTO_CD
      setopt AUTO_PUSHD
      setopt CD_SILENT
      setopt CORRECT
      setopt HIST_IGNORE_DUPS
      setopt PUSHD_IGNORE_DUPS
      setopt SHARE_HISTORY
      setopt HIST_FCNTL_LOCK
    '';
  };
}

