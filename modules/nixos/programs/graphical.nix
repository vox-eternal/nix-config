{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf config.garden.profiles.graphical.enable {
    programs = {
      dconf.enable = true;
    };
  };
}
