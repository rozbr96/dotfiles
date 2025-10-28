
with import <nixpkgs> { };

mkShell {
  buildInputs = [
    hyprls
    lemminx
    lua-language-server
    nixd
  ];
}
