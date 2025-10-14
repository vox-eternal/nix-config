{
  config,
  pkgs,
  ...
}: let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  programs.firefox = {
    enable = config.garden.profiles.graphical.enable;
    languagePacks = ["en_US"];

    # check about:policies#documentation for details on how this works
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
        Category = "strict";
        BaselineExceptions = true;
      };
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      DisplayBookmarksToolbar = "always";
      DisplayMenuBar = "never";
      SearchBar = "unified";
      DNSOverHTTPS = {
        Enabled = true;
        Locked = true;
        Fallback = false;
      };
      HttpsOnlyMode = "force_enabled";
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      Preferences = {
        "privacy.globalprivacycontrol.enabled" = lock-true;
        "browser.urlbar.suggest.trending" = lock-false;
        "browserbrowser.urlbar.suggest.quickactions.urlbar.suggest.quicksuggest.nonsponsored" = lock-false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = lock-false;
        "browser.newtabpage.activity-stream.showWeather" = lock-false;
        "browser.urlbar.suggest.quickactions" = lock-false;
        "browser.urlbar.suggest.engines" = lock-false;
        "browser.theme.content-theme" = {
          Value = 0;
          Status = "locked";
        };
        "browser.theme.toolbar-theme" = {
          Value = 0;
          Status = "locked";
        };
        "browser.newtabpage.activity-stream.trendingSearch.defaultSearchEngine" = {
          Value = "DuckDuckGo";
          Status = "locked";
        };
      };
    };
  };
}
