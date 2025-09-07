{config, inputs, ...}:
let 
  colors = config.vars.base16SchemeNoHash;
in
{
  programs.nixcord = {
    enable = true;          # Enable Nixcord (It also installs Discord)
    vesktop.enable = true;  # Vesktop
    config = {
      useQuickCss = true;
      transparent = true;
      themeLinks = [        # or use an online theme
        "https://capnkitten.github.io/BetterDiscord/Themes/Material-Discord/css/source.css"
      ];
      frameless = true;                   # Set some Vencord options
      plugins = {
       # hideAttachments.enable = true;    # Enable a Vencord plugin
	volumeBooster.enable = true;
        };
      };
    extraConfig = {
      # Some extra JSON config here
      # ...
    };
  };
}
