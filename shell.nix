
with import <nixpkgs> { };

mkShell {
  buildInputs = [
    bash-language-server
    hyprls
    lemminx
    lua-language-server
    nixd
    nixfmt
    systemd-language-server
  ];
}
