{
  description = "Voxxus's dotfiles";

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = [./modules/flake];};

  inputs = {
    # our main package supplier
    #
    # you may also notice that I don't use a `github:` url for nixpkgs this is
    # beacuse we can save 15mb of data by using the channel tarball this is not
    # a major saving but it is nice to have
    # https://deer.social/profile/did:plc:mojgntlezho4qt7uvcfkdndg/post/3loogwsoqok2w
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    lix = {
      type = "github";
      owner = "isabelroses";
      repo = "izlix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # improved support for wsl
    nixos-wsl = {
      type = "github";
      owner = "nix-community";
      repo = "NixOS-WSL";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
      };
    };

    # manage userspace with nix
    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### Flake management
    # bring all the mess together with flake-parts
    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # easily manage our hosts
    easy-hosts = {
      type = "github";
      owner = "tgirlcloud";
      repo = "easy-hosts";
    };

    # Secrets, shhh
    sops = {
      type = "github";
      owner = "Mic92";
      repo = "sops-nix";
      ref = "pull/779/merge";
    };

    # transative deps
    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };
  };
}
