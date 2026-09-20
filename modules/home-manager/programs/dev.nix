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
  ];

}
