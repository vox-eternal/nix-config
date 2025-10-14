{lib, ...}: let
  inherit (lib) mkOption types;
in {
  imports = [
    ./nvidia.nix
  ];

  options.garden.device.gpu = mkOption {
    type = types.nullOr (
      types.enum [
        "nvidia"
      ]
    );
    default = null;
    description = "The designer of the primary system gpu";
  };
}
