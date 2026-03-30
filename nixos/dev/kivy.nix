with import <nixpkgs> { };

mkShell {
  buildInputs = [
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    dpkg
    freetype
    libGL
    libgcc
    libglvnd
    libjpeg
    libpng
    libxkbcommon
    mesa
    mtdev
    pkg-config
    pyright
    python312
    scrcpy
    stdenv.cc.cc.lib
    wayland
    wayland-protocols
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcursor
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXinerama
    xorg.libXrandr
    xorg.libXrender
    xorg.libxcb
    zlib
  ];

  shellHook = ''
    [ ! -f .venv ] && python -m venv .venv

    source .venv/bin/activate

    export SDL_VIDEODRIVER=wayland
    export SDL_RENDER_DRIVER=opengl

    export LD_LIBRARY_PATH="${
      lib.makeLibraryPath [
        stdenv.cc.cc.lib
        libglvnd
        libGL
        mesa
        mtdev
      ]
    }:$LD_LIBRARY_PATH"
  '';
}
