{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (config.garden) device;
  inherit (lib) mkIf mkDefault;
in {
  config = mkIf (device.gpu == "nvidia") {
    services.xserver.videoDrivers = ["nvidia"];

    garden.packages = {
      inherit (pkgs.nvtopPackages) nvidia;

      inherit
        (pkgs)
        vulkan-tools
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
        libva
        libva-utils
        ;
    };

    hardware = {
      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.beta;

        powerManagement = {
          enable = true;
          finegrained = false;
        };

        open = true;

        nvidiaSettings = true;

        nvidiaPersistenced = true;
      };

      graphics = {
        extraPackages = [pkgs.nvidia-vaapi-driver];
        extraPackages32 = [pkgs.pkgsi686Linux.nvidia-vaapi-driver];
      };
    };
  };
}
