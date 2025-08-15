{
  config,
  pkgs,
  ...
}: {
  programs = {
    btop = {
      enable = true;
      themes = {
        tokyo-night = ../../dotfiles/btop/themes/tokyo-night.theme;
      };
      settings = {
        color_theme = "${config.home.homeDirectory}/.config/btop/themes/tokyo-night.theme";
      };
    };
  };
}
