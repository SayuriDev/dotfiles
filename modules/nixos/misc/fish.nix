{ pkgs, config, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      nht = "nh os test";
      nhs = "nh os switch";
      yz = "yazi";
    };
  };
  users.users.${config.vars.username}.shell = pkgs.fish;
}
