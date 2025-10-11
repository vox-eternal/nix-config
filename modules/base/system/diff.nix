{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkAfter
    mkEnableOption
    ;
in {
  options.garden.system.activation.diff.enable =
    mkEnableOption "Enable a system diff"
    // {
      default = true;
    };

  # if the system supports dry activation, this means that we can compare
  # the current system with the one we are about to switch to
  # this can be useful to see what will change, and the clousure size
  config = mkIf config.garden.system.activation.diff.enable {
    system.activationScripts.diff = {
      text = ''
        if [[ -e /run/current-system ]]; then
          echo "=== diff to current-system ==="
          ${lib.getExe pkgs.lix-diff} --lix-bin ${config.nix.package}/bin /run/current-system "$systemConfig"
          echo "=== end of the system diff ==="
        fi
      '';
    };
    system.activationScripts.diff.supportsDryActivation = true;
  };
}
