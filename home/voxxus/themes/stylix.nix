{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) mkIf;
in {
  imports = [inputs.stylix.homeModules.stylix];

  stylix = mkIf (config.garden.profiles.graphical.enable) {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    targets = {
      firefox = {
        profileNames = ["default"];
        enable = true;
      };
      nixcord = {
      	enable = false;
	};
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.hack-font;
        name = "Hack";
      };
    };
  };
}
