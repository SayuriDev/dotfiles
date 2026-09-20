{ lib, ... }:
with lib;
let
  stripHash =
    attrs: builtins.mapAttrs (_: val: builtins.substring 1 (builtins.stringLength val - 1) val) attrs;

  base16 = {
    base00 = "#0d0e1c";
    base01 = "#1a1b2e";
    base02 = "#303650";
    base03 = "#595959";
    base04 = "#a6a6a6";
    base05 = "#ffffff";
    base06 = "#e0dfe4";
    base07 = "#ffffff";
    base08 = "#ff5f59";
    base09 = "#ff6b55";
    base0A = "#d0bc00";
    base0B = "#44bc44";
    base0C = "#00d3d0";
    base0D = "#2fafff";
    base0E = "#b6a0ff";
    base0F = "#feacd0";
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
