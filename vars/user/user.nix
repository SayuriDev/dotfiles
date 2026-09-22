{ lib, ... }:
with lib;
let
  data = import ./data.nix;

in
{
  options.vars = {
    username = mkOption {
      type = types.str;
      default = data.username;
      description = "Username";
    };
  };
}
