{pkgs, ...}:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      nht = "nh os test";
      nhs = "nh os switch";
      yz = "yazi";
    };
  };
  users.users.sayu.shell = pkgs.fish;
}

