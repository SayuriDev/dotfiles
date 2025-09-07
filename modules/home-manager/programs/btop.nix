{pkgs, config, ...}:
{
  programs.btop = {
    enable = true;
    extraConfig = ''
      color_theme="stylix"
    '';
  };

}
