
with import <nixpkgs> { };

mkShell {
  buildInputs = [
    bash-language-server
    hyprls
    lemminx
    lua-language-server
    nixd
    systemd-language-server
  ];
}
