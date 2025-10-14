{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkDefault;
in {
  xdg.portal = {
    enable = mkDefault config.garden.profiles.graphical.enable;

    xdgOpenUsePortal = true;

    config.common = {
      default = ["gtk"];
    };

    extraPortals = [pkgs.xdg-desktop-portal-gtk];

    wlr = {
      enable = mkDefault config.garden.profiles.graphical.enable;
      settings = {
        screencast = {
          max_fps = 60;
          chooser_type = "simple";
        };
      };
    };
  };
}
