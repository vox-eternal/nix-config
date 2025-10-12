{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf optionalAttrs;
in {
  garden.packages = optionalAttrs config.garden.profiles.graphical.enable {
    inherit (pkgs) networkmanagerapplet;
  };

  networking.networkmanager = {
    enable = true;
    dns = "default";
    wifi = {
      macAddress = "random";
      scanRandMacAddress = true;
    };
  };
}
