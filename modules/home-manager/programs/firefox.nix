{ 
  pkgs,
  inputs,
  config,
  ...
}:
{
  programs.firefox = {
    package = pkgs.firefox;
    enable = true;
    policies.ExtensionSettings = {"*".installation_mode = "allowed";};
    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        # General
        "extensions.autoDisableScopes" = 0; # do not disable extensions installed by home-manager
        
        "intl.accept_languages" = "pl,en-US,en";
        "browser.startup.page" = 3; # Resume previous session on startup
        "browser.aboutConfig.showWarning" = false;
        "browser.ctrlTab.sortByRecentlyUsed" = false; 
        "browser.download.useDownloadDir" = false;
        "browser.translations.neverTranslateLanguages" = "pl";
        "privacy.clearOnShutdown.history" = false;

        # Allow executing JS in the dev console
        "devtools.chrome.enabled" = true;
        "browser.tabs.crashReporting.sendReport" = false;

        # Allow userChrome.css
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "accessibility.typeaheadfind.enablesound" = false;
        "general.autoScroll" = true;

        # Hardware acceleration
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.rdd-ffmpeg.enabled" = true;
        "widget.dmabuf.force-enabled" = true;
        "media.av1.enabled" = true;

        # Unknown / experimental
        "media.ffvpx.enabled" = false;
        "media.rdd-vpx.enabled" = false;

        # Privacy
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;

        "browser.send_pings" = false;

        # Disable telemetry & tracking
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "beacon.enabled" = false;
        "device.sensors.enabled" = false;
        "geo.enabled" = false;
        "network.dns.echconfig.enabled" = true;

        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "";
        "toolkit.telemetry.unified" = false;

        "extensions.webcompat-reporter.enabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.urlbar.eventTelemetry.enabled" = false;

        # Disable some features
        "extensions.pocket.enabled" = false;
        "extensions.abuseReport.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        "identity.fxaccounts.enabled" = false;
        "identity.fxaccounts.toolbar.enabled" = false;
        "identity.fxaccounts.pairing.enabled" = false;
        "identity.fxaccounts.commands.enabled" = false;

        "browser.contentblocking.report.lockwise.enabled" = false;
        "browser.uitour.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        # Disable EME (encrypted media extension)
        "browser.eme.ui.enabled" = false;
        "media.eme.enabled" = false;

        # Network & push notifications
        "network.predictor.enabled" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;

        "dom.push.enabled" = false;
        "dom.push.connection.enabled" = false;
        "dom.battery.enabled" = false;
        "dom.private-attribution.submission.enabled" = false;
      };

      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          sponsorblock
          darkreader
          bitwarden
          youtube-shorts-block
          tabliss
        ];
      };
    };
  };


  # home.persistence."/state".directories = [
  #   ".cache/mozilla"
  # ];
  # home.persistence."/persist".directories = [
  #   ".mozilla"
  # ];
}
