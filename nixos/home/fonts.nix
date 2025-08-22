{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fira-code
    fira-code-symbols
    google-fonts
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-emoji
    orbitron
  ];

  fonts.fontconfig.enable = true;   # ensures fonts are visible in Ubuntu/Kitty
}
