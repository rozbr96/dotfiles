
with import <nixpkgs> { };

mkShell {
  buildInputs = [
    elixir
    erlang
    beam27Packages.elixir-ls
  ];

  shellHook = ''
    echo "Elixir: $(elixir --version)"
    echo "Erlang: $(erl -version 2>&1)"
  '';
}
