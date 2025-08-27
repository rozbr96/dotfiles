
with import <nixpkgs> { };

mkShell {
  buildInputs = [
    hyprls
    lua-language-server
    nixd
  ];
}
