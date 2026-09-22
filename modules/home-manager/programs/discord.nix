{ config, inputs, ... }:
let
  colors = config.vars.base16Scheme;
in
{
  programs.nixcord = {
    enable = true;
    vesktop = {
      enable = true;
      settings = {
        arRPC = true;
      };
    };
    discord.vencord.enable = true;

    quickCss = ''
      :root {
        --base00: ${colors.base00};
        --base01: ${colors.base01};
        --base02: ${colors.base02};
        --base03: ${colors.base03};
        --base04: ${colors.base04};
        --base05: ${colors.base05};
        --base06: ${colors.base06};
        --base07: ${colors.base07};
        --base08: ${colors.base08};
        --base09: ${colors.base09};
        --base0A: ${colors.base0A};
        --base0B: ${colors.base0B};
        --base0C: ${colors.base0C};
        --base0D: ${colors.base0D};
        --base0E: ${colors.base0E};
        --base0F: ${colors.base0F};
      }

      /* ============ Core surfaces ============ */
      .theme-dark, .theme-light {
        --background-primary: var(--base00) !important;
        --background-secondary: var(--base01) !important;
        --background-secondary-alt: var(--base01) !important;
        --background-tertiary: var(--base00) !important;
        --background-floating: var(--base01) !important;
        --background-mobile-primary: var(--base00) !important;
        --background-mobile-secondary: var(--base01) !important;

        --background-modifier-hover: var(--base02) !important;
        --background-modifier-active: var(--base02) !important;
        --background-modifier-selected: var(--base02) !important;
        --background-modifier-accent: var(--base03) !important;

        --channeltextarea-background: var(--base01) !important;
        --input-background: var(--base01) !important;

        /* ============ Text ============ */
        --text-normal: var(--base05) !important;
        --text-muted: var(--base04) !important;
        --text-link: var(--base0D) !important;
        --header-primary: var(--base06) !important;
        --header-secondary: var(--base04) !important;

        --interactive-normal: var(--base04) !important;
        --interactive-hover: var(--base06) !important;
        --interactive-active: var(--base07) !important;
        --interactive-muted: var(--base03) !important;

        /* ============ Accent / brand ============ */
        --brand-experiment: var(--base0D) !important;
        --brand-experiment-560: var(--base0D) !important;
        --brand-experiment-500: var(--base0D) !important;

        /* ============ Status colors ============ */
        --status-positive: var(--base0B) !important;
        --status-warning: var(--base0A) !important;
        --status-danger: var(--base08) !important;
        --status-positive-background: var(--base0B) !important;
        --status-danger-background: var(--base08) !important;

        /* ============ Scrollbars ============ */
        --scrollbar-thin-thumb: var(--base02) !important;
        --scrollbar-auto-thumb: var(--base02) !important;
        --scrollbar-auto-track: var(--base00) !important;

        /* ============ Mentions ============ */
        --mention-background: var(--base01) !important;
        --mention-foreground: var(--base0A) !important;
      }

      /* Code blocks */
      code, pre {
        background-color: var(--base01) !important;
        color: var(--base0C) !important;
      }

      /* Embeds / blockquotes */
      .embedFull_dc80c9, .container__74d8a {
        background-color: var(--base01) !important;
        border-left-color: var(--base0D) !important;
      }
    '';

    config = {
      useQuickCss = true;

      themeLinks = [
        # or use an online theme
        # "https://capnkitten.github.io/BetterDiscord/Themes/Material-Discord/css/source.css"
      ];

      frameless = false;
      plugins = {
        volumeBooster.enable = true;
        ClearURLs.enable = true;
        fixImagesQuality.enable = true;
        iLoveSpam.enable = true;
        imageFilename.enable = true;
        imageZoom.enable = true;
        noF1.enable = true;
        reverseImageSearch.enable = true;
        streamerModeOnStream.enable = true;
        gameActivityToggle.enable = true;
      };
    };

    extraConfig = {
      # Some extra JSON config here
      # ...
    };
  };
}
