
with import <nixpkgs> { };

mkShell {
  buildInputs = [
    hyprls
    nixd
  ];
}
