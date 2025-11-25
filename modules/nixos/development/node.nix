{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf;
in {
  garden.packages = mkIf config.garden.profiles.workstation.enable {
    inherit (pkgs) nodejs pnpm;
  };
}
