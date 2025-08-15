{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home = {
    packages = with pkgs; [
      nvimpager
    ];
    sessionVariables = {
      MANPAGER = "nvim +Man!";
      PAGER = "nvimpager";
    };
  };
}
