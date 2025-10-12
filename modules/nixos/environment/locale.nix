{
  lib,
  config,
  ...
}: {
  time = {
    timeZone = lib.mkDefault "America/New_York";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";

    extraLocaleSettings = lib.mkDefault {
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };
}
