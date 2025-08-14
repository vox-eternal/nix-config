{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      git
      act
      gh
    ];
  };
  programs = {
    git = {
      enable = true;
      userName = "vox-eternal";
      userEmail = "voxxus@proton.me";
      lfs = {
        enable = true;
      };
      signing = {
        key = "d2b664b9972e8e321d3ba0df4ef7aa1a3927ec28ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIByAlyhN/aO8uLlv2jrp+eFJDB7142c7Wb07tyvH+8Xs voxxus@izar";
        signByDefault = true;
      };
      extraConfig = {
        gpg = {
          format = "ssh";
        };
        user = {
          signingkey = "~/.ssh/id_ed25519";
        };
        commit = {
          gpgsign = true;
        };
        push = {
          autoSetupRemote = true;
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
