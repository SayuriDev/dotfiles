{ pkgs, ... }:
{

  home.packages = with pkgs; [
    rustc
    rustfmt
    cargo

    nodejs
    yarn

    python3

    platformio

    android-tools
    libXrender

    kicad

    openocd-rp2040
    stlink
    libtool

    gcc
    gnumake
    cmake
    pkg-config
    valgrind
    gcc-arm-embedded

    virt-viewer
  ];

}
