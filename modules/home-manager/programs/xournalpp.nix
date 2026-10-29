{ pkgs, ... }:
{
  home.packages = [ pkgs.xournalpp ];

  xdg.configFile."xournalpp/settings.xml" = {
    source = ./xournalpp.xml;
    force = true;
  };
}
