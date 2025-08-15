{
  pkgs,
  inputs,
  stable,
  unstable,
  ...
}: let
  NAME = "voxxus";
in {
  imports = [
    (import ../../systemModules/nixHelper.nix {inherit NAME;})
    (import ../../systemModules/sops.nix {inherit NAME;})
  ];
  users = {
    users = {
      "${NAME}" = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
        shell = pkgs.zsh;
      };
    };
  };
  programs.zsh.enable = true;
  home-manager = {
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {inherit inputs stable unstable;};
    users = {
      "${NAME}" = import ./home.nix;
    };
  };
}
