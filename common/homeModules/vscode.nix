{pkgs, ...}: {
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          kamadorueda.alejandra
          jnoortheen.nix-ide
        ];
        userSettings = {
          "editor.fontFamily" = "'ComicShannsMono Nerd Font Mono', 'monospace', monospace";
        };
      };
    };
  };
  home = {
    sessionVariables = {
      DONT_PROMPT_WSL_INSTALL = "true";
    };
  };
}
