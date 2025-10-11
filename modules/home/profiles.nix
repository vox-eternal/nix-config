{
  lib,
  osConfig,
  ...
}: {
  garden.profiles = {
    inherit
      (osConfig.garden.profiles)
      graphical
      headless
      workstation
      laptop
      ;

    gaming = {inherit (osConfig.garden.profiles.gaming) enable;};
  };
}
