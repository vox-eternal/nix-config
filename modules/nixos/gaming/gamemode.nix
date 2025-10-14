{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
in {
  options.garden.profiles.gaming.gamemode.enable =
    mkEnableOption "Gamemode"
    // {
      default = config.garden.profiles.gaming.enable;
    };

  config.programs.gamemode = mkIf config.garden.profiles.gaming.gamemode.enable {
    enable = true;
    enableRenice = true;

    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
    };
  };
}
