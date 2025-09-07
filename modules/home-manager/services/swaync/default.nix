{ pkgs, pkgs-stable, config, ... }:
let 
  colors = config.vars.base16Scheme;
in {
  services.swaync = {
    enable = true;
    package = pkgs-stable.swaynotificationcenter; # unstable was crashing my apps
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      cssPriority = "user";
      notification-icon-size = 64;
      notification-body-image-height = 128;
      notification-body-image-width = 200;
      timeout = 6;
      timeout-low = 3;
      timeout-critical = 0;
      fit-to-screen = false;
      notification-window-width = 375;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      notification-visibility = {
        spotify = {
          state = "enabled";
          urgency = "Low";
          app-name = "Spotify";
        };
        youtube-music = {
          state = "enabled";
          urgency = "Low";
          app-name = "com.github.th_ch.youtube_music";
        };
      };
    };
    style = ''
      @define-color shadow rgba(0, 0, 0, 0.25);

      @define-color base ${colors.base00};
      @define-color mantle ${colors.base01};
      @define-color crust ${colors.base02};

      @define-color text ${colors.base05};

      @define-color surface0 ${colors.base02};

      * {
        font-family: "Product Sans";
        background-clip: border-box;
      }

      label {
        color: @text;
      }

      .body {
        color: @text;
        font-size: 14px;
        white-space: normal;
        word-wrap: break-word;
        margin-top: 6px;
      }


      .notification {
        border: none;
        box-shadow: none;
        /* margin: 0px; */
        /* margin: -15px -10px -15px -10px; */
        border-radius: 12px;
        background: @mantle;
      }

      .notification button {
        background: transparent;
        border-radius: 0px;
        border: none;
        margin: 0px;
        padding: 0px;
      }

      .notification button:hover {
         background: @surface0;
      }

      .notification-content {
        min-height: 64px;
        margin: 10px;
        padding: 0px;
        border-radius: 0px;
      }

      .close-button {
        background: transparent;
        color: transparent;
      }

      .notification-default-action,
      .notification-action {
        background: transparent;
        border: none;
      }


      .notification-default-action {
        border-radius: 4px;
      }

      /* When alternative actions are visible */
      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-action {
        border-radius: 0px;
        padding: 2px;
        color: @text;
      }

      /* add bottom border radius to eliminate clipping */
      .notification-action:first-child {
        border-bottom-left-radius: 4px;
      }

      .notification-action:last-child {
        border-bottom-right-radius: 4px;
      }

      /*** Notification ***/
      .summary {
        color: @text;
        font-size: 14px;
        margin-bottom: 4px;
      }
    '';
  };
  }