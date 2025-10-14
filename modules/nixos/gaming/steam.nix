{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkOption mkEnableOption;

  cfg = config.garden.profiles.gaming.steam;
in {
  options = {
    garden.profiles.gaming.steam = {
      enable =
        mkEnableOption "Enable Steam"
        // {
          default = config.garden.profiles.gaming.enable;
        };

      gamescopeSession = {
        enable =
          mkEnableOption "gamescope TTY session"
          // {
            default = cfg.enable;
          };

        tty = mkOption {
          default = 4;
          type = lib.types.int;
          description = "TTY to connect gamescope session to";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };

    programs.steam = mkIf cfg.enable {
      enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin.steamcompattool];
      gamescopeSession.enable = cfg.gamescopeSession.enable;
    };

    garden.packages = {
      exec-gamescope = pkgs.writeShellApplication {
        name = "exec-gamescope";
        text = ''
          exec gamescope --adaptive-sync --rt --steam -- steam -pipewire-dmabuf -tenfoot
        '';
      };
    };

    environment.loginShellInit = mkIf cfg.gamescopeSession.enable ''
      [[ "$(tty)" = "/dev/tty${toString cfg.gamescopeSession.tty}" ]] && exec-gamescope
    '';
  };
}
