{config, ...}: {
  # Install and configure waybar via home-manager module
  programs.waybar = {
    enable = true;
  };
  home.file = {
  ".config/waybar/config.jsonc".source = ./config.jsonc;
  ".config/waybar/modules.json".source = ./modules.json;
  ".config/waybar/style.css".source = ./style.css;
  ".config/waybar/colors.css".text = ''
    @define-color base00 ${config.stylix.base16Scheme.base00};
    @define-color base01 ${config.stylix.base16Scheme.base01};
    @define-color base02 ${config.stylix.base16Scheme.base02};
    @define-color base03 ${config.stylix.base16Scheme.base03};
    @define-color base04 ${config.stylix.base16Scheme.base04};
    @define-color base05 ${config.stylix.base16Scheme.base05};
    @define-color base06 ${config.stylix.base16Scheme.base06};
    @define-color base07 ${config.stylix.base16Scheme.base07};
    @define-color base08 ${config.stylix.base16Scheme.base08};
    @define-color base09 ${config.stylix.base16Scheme.base09};
    @define-color base0A ${config.stylix.base16Scheme.base0A};
    @define-color base0B ${config.stylix.base16Scheme.base0B};
    @define-color base0C ${config.stylix.base16Scheme.base0C};
    @define-color base0D ${config.stylix.base16Scheme.base0D};
    @define-color base0E ${config.stylix.base16Scheme.base0E};
    @define-color base0F ${config.stylix.base16Scheme.base0F};
    '';

  };
  
  stylix.targets.waybar.enable = false;

}