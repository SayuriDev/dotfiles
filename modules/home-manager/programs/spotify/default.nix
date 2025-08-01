{pkgs, inputs, ...}: {
programs.spicetify =
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
  {
    enable = true;
  
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      betterGenres
      volumePercentage
      beautifulLyrics
    ];
    enabledCustomApps = with spicePkgs.apps; [
      
    ];
    enabledSnippets = with spicePkgs.snippets; [
        ''{
         "title": "Remove Popular sections from homepage",
         "description": "Thanks Spotify, but I have a music taste",
         "code": "[data-testid='home-page'] .contentSpacing > [data-testid='component-shelf']:has([href='/section/0JQ5DAuChZYPe9iDhh2mJz'], [href='/section/0JQ5DAnM3wGh0gz1MXnu4h'], [href='/section/0JQ5DAnM3wGh0gz1MXnu3B'], [href='/section/0JQ5DAnM3wGh0gz1MXnu3D']) { display: none !important; }",
         "preview": "resources/assets/snippets/remove-popular.png"
        }
        {
         "title": "Hide recent searches",
         "description": "Hides the recent searches section on the search page",
         "code": ".main-shelf-shelf:has(.x-searchHistoryEntries-searchHistoryEntry) {display: none;}",
         "preview": "resources/assets/snippets/hide-recent-searches.png"
        }
        ''

    ];

  };
}