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

  home.file.".local/share/plasma/plasmoids/true-custom-clock".source =
    ../../../assets/plasma/plasmoids/true-custom-clock;

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
        location = "left";
        widgets = [
          {
            name = "true-custom-clock";
            config = {
              Appearance = {
                autoFontAndSize = false;
                fontFamily = "IBM Plex Mono";
                fontSize = 16;
                fontStyleName = "Regular";
                fontWeight = 400;
              };
            };
          }
          { name = "org.kde.plasma.marginsseparator"; }
          {
            name = "org.kde.plasma.systemtray";
            config = {
              General = {
                extraItems = "org.kde.plasma.cameraindicator,org.kde.plasma.clipboard,org.kde.plasma.devicenotifier,org.kde.plasma.manage-inputmethod,org.kde.plasma.mediacontroller,org.kde.plasma.notifications,org.kde.kscreen,org.kde.plasma.battery,org.kde.plasma.brightness,org.kde.plasma.keyboardindicator,org.kde.plasma.keyboardlayout,org.kde.plasma.networkmanagement,org.kde.plasma.volume,org.kde.plasma.weather";
                knownItems = "org.kde.plasma.cameraindicator,org.kde.plasma.clipboard,org.kde.plasma.devicenotifier,org.kde.plasma.manage-inputmethod,org.kde.plasma.mediacontroller,org.kde.plasma.notifications,org.kde.kscreen,org.kde.plasma.battery,org.kde.plasma.brightness,org.kde.plasma.keyboardindicator,org.kde.plasma.keyboardlayout,org.kde.plasma.networkmanagement,org.kde.plasma.volume,org.kde.plasma.weather";
                reverseIconOrder = true;
              };
            };
          }
          {
            name = "luisbocanegra.panel.colorizer";
            config = {
              General = {
                configurationOverrides = builtins.toJSON {
                  overrides = { };
                  associations = [ ];
                };
                globalSettings = builtins.readFile ../../../assets/plasma/colorizer-global-settings.json;
                hideWidget = true;
                lastPreset = "/home/sayu/.local/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/presets/Black";
                panelWidgets = builtins.readFile ../../../assets/plasma/colorizer-panel-widgets.json;
              };
            };
          }
          { name = "org.kde.plasma.panelspacer"; }
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                fill = false;
                indicateAudioStreams = false;
                reverseMode = true;
                launchers = "applications:org.kde.dolphin.desktop,applications:firefox.desktop,applications:kitty.desktop,applications:code.desktop,applications:vesktop.desktop";
              };
            };
          }
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                favoritesPortedToKAstats = true;
              };
            };
          }
        ];
      }
    ];

    shortcuts = {
      kwin = {
        "Window Close" = "Meta+Shift+Q";
        "Kill Window" = "Meta+Shift+Alt+Q";
      };
    };

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
