{ lib, ... }:
with lib;
let
  stripHash = attrs: builtins.mapAttrs (_: val: builtins.substring 1 (builtins.stringLength val - 1) val) attrs;

  base16 = {
    base00 = "#181825";
    base01 = "#1e1e2e";
    base02 = "#313244";
    base03 = "#45475a";
    base04 = "#585b70";
    base05 = "#cdd6f4";
    base06 = "#f5e0dc";
    base07 = "#b4befe";
    base08 = "#f38ba8";
    base09 = "#fab387";
    base0A = "#f9e2af";
    base0B = "#a6e3a1";
    base0C = "#94e2d5";
    base0D = "#89b4fa";
    base0E = "#cba6f7";
    base0F = "#f2cdcd";
  };
in
{
  options.vars = {
    base16Scheme = mkOption {
      type = lib.types.attrs;
      default = base16;
      description = "My base16 scheme";
    };
    base16SchemeNoHash = mkOption {
      type = lib.types.attrs;
      default = stripHash base16;
      description = "My base16 scheme without hashtags";
    };
  };
}
