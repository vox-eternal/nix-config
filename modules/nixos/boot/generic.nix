{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib.modules) mkDefault;
  inherit (lib.types) raw;
  inherit (lib.options) mkOption;

  cfg = config.garden.system.boot;
in {
  options.garden.system.boot = {
    kernel = mkOption {
      type = raw;
      default = pkgs.linuxPackages_latest;
      defaultText = "pkgs.linuxPackages_latest";
      description = "The kernel to use for the system.";
    };
  };

  config.boot = {
    kernelPackages = cfg.kernel;
  };
}
