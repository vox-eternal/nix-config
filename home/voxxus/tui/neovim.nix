{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    inherit (config.garden.profiles.workstation) enable;
  };
}
