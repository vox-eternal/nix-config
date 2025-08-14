{pkgs, ...}: {
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        kamadorueda.alejandra
        jnoortheen.nix-ide
      ];
    };
  };
}
