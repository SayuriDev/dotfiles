{pkgs, ...}:
{
 home.packages = with pkgs; [
   quickshell
   qt5.qtdeclarative
   qt5.qtgraphicaleffects
   kdePackages.qt5compat
 ];
}