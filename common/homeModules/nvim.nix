{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home = {
    packages = with pkgs; [
      nvimpager
      # to build lsp servers
      cargo
      rustc
    ];
    file = {
      nvim = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/dotfiles/nvim";
        target = "${config.home.homeDirectory}/.config/nvim";
      };
    };
    sessionVariables = {
      MANPAGER = "nvim +Man!";
      PAGER = "nvimpager";
    };
  };
}
