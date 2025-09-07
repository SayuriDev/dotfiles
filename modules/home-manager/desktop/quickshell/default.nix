{pkgs, config, lib, ...}:
{
 home.packages = with pkgs; [
   quickshell
   qt5.qtdeclarative
   qt5.qtgraphicaleffects
   kdePackages.qt5compat
   inter 
 ];  
  home.file.".config/quickshell/assets/shared/profile.png".source = config.vars.profile;

  home.activation.qsSymlink = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf $HOME/.config/quickshell
    ln -s $HOME/dotfiles/modules/home-manager/desktop/quickshell/quickshell $HOME/.config/quickshell
  '';

}