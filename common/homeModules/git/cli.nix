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
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
