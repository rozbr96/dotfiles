
with import <nixpkgs> {};

mkShell {
  buildInputs = [
    emmet-language-server
    typescript-language-server
    vue-language-server
  ];
}

