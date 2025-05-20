{ config, pkgs, ... }:

{
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "JetBrains Mono";
        bold_font = "JetBrains Mono Bold";
        italic_font = "JetBrains Mono Italic";
        bold_italic_font = "JetBrains Mono Bold Italic";
        font_size = 12.0;  # Adjust size as needed
      };
    };
}