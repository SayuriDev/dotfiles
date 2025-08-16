{config, inputs, ...}:
let 
  colors = config.vars.base16SchemeNoHash;
in
{
  programs.nixcord = {
    enable = true;          # Enable Nixcord (It also installs Discord)
    vesktop.enable = true;  # Vesktop
    quickCss = "
    /**
/* import theme modules */
@import url('https://refact0r.github.io/system24/build/system24.css');

body {
    --font: 'DM Mono'; /* change to '' for default discord font */
    --code-font: 'DM Mono'; /* change to '' for default discord font */
    font-weight: 400; /* text font weight. 300 is light, 400 is normal. DOES NOT AFFECT BOLD TEXT */
    letter-spacing: -0.05ch; /* decreases letter spacing for better readability. recommended on monospace fonts.*/

    /* sizes */
    --gap: 12px; /* spacing between panels */
    --divider-thickness: 4px; /* thickness of unread messages divider and highlighted message borders */
    --border-thickness: 2px; /* thickness of borders around main panels. DOES NOT AFFECT OTHER BORDERS */
    --border-hover-transition: 0.2s ease; /* transition for borders when hovered */

    /* animation/transition options */
    --animations: on; /* off: disable animations/transitions, on: enable animations/transitions */
    --list-item-transition: 0.2s ease; /* transition for list items */
    --dms-icon-svg-transition: 0.4s ease; /* transition for the dms icon */

    /* top bar options */
    --top-bar-height: var(--gap); /* height of the top bar (discord default is 36px, old discord style is 24px, var(--gap) recommended if button position is set to titlebar) */
    --top-bar-button-position: titlebar; /* off: default position, hide: hide buttons completely, serverlist: move inbox button to server list, titlebar: move inbox button to channel titlebar (will hide title) */
    --top-bar-title-position: off; /* off: default centered position, hide: hide title completely, left: left align title (like old discord) */
    --subtle-top-bar-title: off; /* off: default, on: hide the icon and use subtle text color (like old discord) */

    /* window controls */
    --custom-window-controls: off; /* off: default window controls, on: custom window controls */
    --window-control-size: 14px; /* size of custom window controls */

    /* dms button options */
    --custom-dms-icon: off; /* off: use default discord icon, hide: remove icon entirely, custom: use custom icon */
    --dms-icon-svg-url: url(''); /* icon svg url. MUST BE A SVG. */
    --dms-icon-svg-size: 90%; /* size of the svg (css mask-size property) */
    --dms-icon-color-before: var(--icon-secondary); /* normal icon color */
    --dms-icon-color-after: var(--white); /* icon color when button is hovered/selected */
    --custom-dms-background: off; /* off to disable, image to use a background image (must set url variable below), color to use a custom color/gradient */
    --dms-background-image-url: url('https://raw.githubusercontent.com/catppuccin/catppuccin/refs/heads/main/assets/logos/exports/macchiato_square.png'); /* url of the background image */
    --dms-background-image-size: cover; /* size of the background image (css background-size property) */
    --dms-background-color: linear-gradient(70deg, var(--blue), var(--purple), var(--red)); /* fixed color/gradient (css background property) */

    /* background image options */
    --background-image: off; /* off: no background image, on: enable background image (must set url variable below) */
    --background-image-url: url(''); /* url of the background image */

    /* transparency/blur options */
    /* NOTE: TO USE TRANSPARENCY/BLUR, YOU MUST HAVE TRANSPARENT BG COLORS. FOR EXAMPLE: --bg-4: hsla(220, 15%, 10%, 0.7); */
    --transparency-tweaks: on; /* off: no changes, on: remove some elements for better transparency */
    --remove-bg-layer: on; /* off: no changes, on: remove the base --bg-3 layer for use with window transparency (WILL OVERRIDE BACKGROUND IMAGE) */
    --panel-blur: on; /* off: no changes, on: blur the background of panels */
    --blur-amount: 12px; /* amount of blur */
    --bg-floating: var(--bg-3); /* set this to a more opaque color if floating panels look too transparent. only applies if panel blur is on  */

    /* other options */
    --small-user-panel: on; /* off: default user panel, on: smaller user panel like in old discord */

    /* unrounding options */
    --unrounding: off; /* off: default, on: remove rounded corners from panels */

    /* styling options */
    --custom-spotify-bar: on; /* off: default, on: custom text-like spotify progress bar */
    --ascii-titles: on; /* off: default, on: use ascii font for titles at the start of a channel */
    --ascii-loader: cats; /* off: default, system24: use system24 ascii loader, cats: use cats loader */

    /* panel labels */
    --panel-labels: on; /* off: default, on: add labels to panels */
    --label-color: var(--text-muted); /* color of labels */
    --label-font-weight: 500; /* font weight of labels */
}

/* color options */
:root {
    --colors: on; /* off: discord default colors, on: midnight custom colors */

    /* background and dark colors */
    --bg-1: ${colors.base03}CC; /* dark buttons when clicked */
    --bg-2: ${colors.base02}CC; /* dark buttons */
    --bg-3: ${colors.base01}CC; /* spacing, secondary elements */
    --bg-4: ${colors.base00}CC; /* main background color */
    --hover: ${colors.base04}1a; /* channels and buttons when hovered */
    --active: ${colors.base04}33; /* channels and buttons when clicked or selected */
    --active-2: ${colors.base04}4d; /* extra state for transparent buttons */
    --message-hover: hsla(0, 0%, 0%, 0.10); /* messages when hovered */

    /* accent colors */
    --accent-2: var(--purple);

    /* status indicator colors */
    --online: var(--green); /* change to #43a25a for default */
    --dnd: var(--red); /* change to #d83a42 for default */
    --idle: var(--yellow); /* change to #ca9654 for default */
    --streaming: var(--purple); /* change to #593695 for default */
    --offline: var(--text-4); /* change to #83838b for default offline color */

    /* border colors */
    --border-light: var(--hover); /* general light border color */
    --border: var(--active); /* general normal border color */
    --border-hover: var(--accent-2); /* border color of panels when hovered */
    --button-border: hsl(235, 0%, 100%, 0.1); /* neutral border color of buttons */

    /* base colors */
    --red: ${colors.base08};
    --green: ${colors.base0B};
    --blue: ${colors.base0D};
    --yellow: ${colors.base0A};
    --purple: ${colors.base0E};
}
";
    config = {
      useQuickCss = true;
      transparent = true;
      # themeLinks = [        # or use an online theme
      #   "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-catppuccin-mocha.theme.css"
      # ];
      frameless = true;                   # Set some Vencord options
      plugins = {
        hideAttachments.enable = true;    # Enable a Vencord plugin
        };
      };
    extraConfig = {
      # Some extra JSON config here
      # ...
    };
  };
}
