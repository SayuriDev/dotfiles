{ pkgs, ... }:
{

  home.packages = with pkgs; [
    rustc
    rustfmt
    cargo

    nodePackages_latest.nodejs
    yarn
  ];

}
