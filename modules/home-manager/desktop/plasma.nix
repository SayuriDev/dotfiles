{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

  home.file.".local/share/plasma/desktoptheme/obsidian".source = ../../../assets/themes/obsidian;
  home.file.".local/share/color-schemes/ModusVivendiTinted.colors".source =
    ../../../assets/themes/ModusVivendiTinted/ModusVivendiTinted.colors;

  home.packages = with pkgs; [
    papirus-icon-theme
    bibata-cursors
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    input.mice = [
      {
        acceleration = 0.1;
        accelerationProfile = "none";
        enable = true;
        leftHanded = false;
        middleButtonEmulation = false;
        name = "Beken 2.4G Wireless Device";
        productId = "fa60";
        vendorId = "1d57";
        naturalScroll = false;
        scrollSpeed = 1;
      }
    ];

    kwin.effects.shakeCursor.enable = false;

    workspace = {
      # lookAndFeel = "org.kde.breezedark.desktop";
      clickItemTo = "select";
      theme = "Obsidian"; # plasma style
      colorScheme = "ModusVivendiTinted";
      cursor.theme = "Bibata-Modern-Ice";
      iconTheme = "Papirus-Dark";
      wallpaper = config.vars.wallpaper;
      enableMiddleClickPaste = false;
    };

    hotkeys.commands."launch-kitty" = {
      name = "Launch Kitty";
      key = "Meta+Q";
      command = "kitty";
    };

    panels = [
      {
        location = "bottom";
        widgets = [
          "org.kde.plasma.kickoff"
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:firefox.desktop"
                "applications:kitty.desktop"
                "applications:code.desktop"
                "applications:vesktop.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
      # {
      #   location = "top";
      #   height = 26;
      #   widgets = [ "org.kde.plasma.appmenu" ];
      # }
    ];

    shortcuts = {
      kwin = {
        "Window Close" = "Meta+Shift+Q";
        "Kill Window" = "Meta+Shift+Alt+Q";
      };
    };

    #
    # Some low-level settings:
    #
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;

      "kwinrc" = {
        "org.kde.kdecoration2" = {
          "ButtonsOnLeft" = "";
          "ButtonsOnRight" = "IAX";
        };
        "Desktops"."Number" = {
          value = 8;
          immutable = true; # dont change this
        };
        "TabBox" = {
          "HighlightWindows" = false;
          "ShowDesktopMode" = 0;
          "SwitchingMode" = 0;
        };
      };

      "kdeglobals"."KDE"."AnimationDurationFactor" = 0.6;
    };
  };
}
