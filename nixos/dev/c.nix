with import <nixpkgs> {};

mkShell {
  buildInputs = [
    clang-tools
  ];
}

