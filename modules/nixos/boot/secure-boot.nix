{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (lib.modules) mkIf mkForce;
  inherit (lib.options) mkEnableOption;
  sys = config.garden.system.boot;
in {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

  options.garden.system.boot.secureBoot = mkEnableOption "secure-boot and load necessary packages";

  config = mkIf sys.secureBoot {
    garden.packages = {inherit (pkgs) sbctl;};

    # lanzaboote replaces systemd-boot
    boot.loader.systemd-boot.enable = mkForce false;

    boot = {
      bootspec.enable = true;
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
    };
  };
}
