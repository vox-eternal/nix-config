{pkgs, ...}: {
  nixpkgs.config.allowInsecurePredicate = pkg: true;
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  imports = [
    ../../homeModules/dev/nix.nix
    ../../homeModules/git/cli.nix
    ../../homeModules/vscode.nix
    ../../homeModules/sops.nix
  ];

  home.username = "voxxus";
  home.homeDirectory = "/home/voxxus";

  home = {
    packages = with pkgs; [
      wslu
    ];
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
