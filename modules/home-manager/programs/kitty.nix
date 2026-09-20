{ pkgs, lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    font.name = "IBM Plex";
    font.size = 12;
    font.package = pkgs.ibm-plex;

    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
    };
  };
}
