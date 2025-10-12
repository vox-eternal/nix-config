{
  lib,
  pkgs,
  self,
  config,
  ...
}: let
  inherit (lib) mkIf mkMerge map;
  inherit (self.lib) giturl;
in {
  config = mkIf config.garden.profiles.workstation.enable {
    programs.git = {
      enable = true;

      package = pkgs.git;
      userName = "vox-eternal";
      userEmail = "voxxus" + "@" + "proton" + "." + "me"; # webscrapers can go die

      lfs = {
        enable = false;
        skipSmudge = true;
      };

      signing = {
        format = "ssh";
        key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
        signByDefault = true;
      };

      ignores = [
        # system residue
        ".cache/"
        ".DS_Store"
        ".Trashes"
        ".Trash-*"
        "*.bak"
        "*.swp"
        "*.swo"
        "*.elc"
        ".~lock*"

        # build residue
        "tmp/"
        "target/"
        "result"
        "result-*"
        "*.exe"
        "*.exe~"
        "*.dll"
        "*.so"
        "*.dylib"

        # dependencies
        ".direnv/"
        "node_modules"
        "vendor"
      ];

      delta = {
        enable = true;

        options = {
          navigate = true;
          side-by-side = true;
          line-numbers = true;
        };
      };

      extraConfig = {
        init.defaultBranch = "main";
        repack.usedeltabaseoffset = true;
        color.ui = "auto";
        help.autocorrect = 10;

        diff = {
          algorithm = "histogram";
          colorMoved = "plain";
          mnemonicprefix = true;
        };

        color.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";

        branch = {
          autosetupmerge = "true";
          sort = "committerdate";
        };

        commit.verbose = true;

        fetch.prune = true;

        pull = {
          default = "current";
          ff = "only";
        };

        push.autoSetupRemote = true;

        merge = {
          stat = "true";
          conflictstyle = "zdiff3";
          tool = "meld";
        };

        rebase = {
          updateRefs = true;
          autoSquash = true;
          autoStash = true;
        };

        rerere = {
          enabled = true;
          autoupdate = true;
        };

        transfer.fsckObjects = true;
        fetch.fsckObjects = true;
        receive.fsckObjects = true;

        url = mkMerge (
          map giturl [
            {
              domain = "github.com";
              alias = "github";
            }
          ]
        );
      };
    };
  };
}
