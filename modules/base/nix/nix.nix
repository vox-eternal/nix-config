{
  lib,
  pkgs,
  _class,
  inputs,
  inputs',
  ...
}: let
  inherit
    (lib)
    filterAttrs
    attrValues
    mapAttrs
    mkForce
    ;
  inherit (lib.types) isType;

  flakeInputs = filterAttrs (name: value: (isType "flake" value) && (name != "self")) inputs;
in {
  nix = {
    # keep tabs on this for cool new features
    # https://git.lix.systems/lix-project/lix/src/branch/main/doc/manual/rl-next
    # or rendered https://docs.lix.systems/manual/lix/nightly/release-notes/rl-next.html

    package = inputs'.lix.packages.lix;

    # pin the registry to avoid downloading and evaluating a new nixpkgs version everytime
    registry =
      (mapAttrs (_: flake: {inherit flake;}) flakeInputs)
      // {
        # https://github.com/NixOS/nixpkgs/pull/388090
        nixpkgs = lib.mkForce {flake = inputs.nixpkgs;};
      };

    # We love legacy support (for now)
    nixPath =
      if (_class == "nixos")
      then attrValues (mapAttrs (k: v: "${k}=flake:${v.outPath}") flakeInputs)
      else mkForce (mapAttrs (_: v: v.outPath) flakeInputs);

    # set up garbage collection to run <on the time frame specified per system>, and removing packages after 3 days
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };

    # disable usage of nix channels
    channel.enable = false;

    # https://docs.lix.systems/manual/lix/nightly/command-ref/conf-file.html
    settings = {
      # Free up to 20GiB whenever there is less than 5GB left.
      # this setting is in bytes, so we multiply with 1024 by 3
      min-free = 5 * 1024 * 1024 * 1024;
      max-free = 20 * 1024 * 1024 * 1024;

      auto-optimise-store = true;

      # users or groups which are allowed to do anything with the Nix daemon
      allowed-users = ["@wheel"];
      # users or groups which are allowed to manage the nix store
      trusted-users = ["@wheel"];

      # we don't want to track the registry, but we do want to allow the usage
      # of the `flake:` references, so we need to enable use-registries
      use-registries = true;
      flake-registry = "";

      # let the system decide the number of max jobs
      max-jobs = "auto";

      # build inside sandboxed environments
      sandbox = true;

      # supported system features
      system-features = [
        "nixos-test"
        "kvm"
        "recursive-nix"
        "big-parallel"
      ];

      # continue building derivations even if one fails
      # this is important for keeping a nice cache of derivations, usually because I walk away
      # from my PC when building and it would be annoying to deal with nothing saved
      keep-going = true;

      # show more log lines for failed builds, as this happens alot and is useful
      log-lines = 30;

      # https://docs.lix.systems/manual/lix/nightly/contributing/experimental-features.html
      experimental-features = [
        # enables flakes, needed for this config
        "flakes"

        # enables the nix3 commands, a requirement for flakes
        "nix-command"

        # adds a new command called `lix` which allows you to run nix plugins,
        # similar to how cargo works
        "lix-custom-sub-commands"

        # Allows Nix to automatically pick UIDs for builds, rather than creating nixbld* user accounts
        # which is BEYOND annoying, which makes this a really nice feature to have
        "auto-allocate-uids"

        # allows Nix to execute builds inside cgroups
        # remember you must also enable use-cgroups in the nix.conf or settings
        "cgroups"

        # allow usage of the pipe operator in nix expressions
        "pipe-operator"

        # enable the use of the fetchClosure built-in function in the Nix language.
        "fetch-closure"

        # allow nix to automatically coerce integers to strings
        "coerce-integers"
      ];

      # don't warn me if the current working tree is dirty
      # i don't need the warning because i'm working on it right now
      warn-dirty = false;

      # maximum number of parallel TCP connections used to fetch imports and binary caches, 0 means no limit
      http-connections = 0;

      # whether to accept nix configuration from a flake without prompting
      # littrally a CVE waiting to happen <https://x.com/puckipedia/status/1693927716326703441>
      accept-flake-config = false;

      # build from source if the build fails from a binary source
      # fallback = true;

      # this defaults to true, however it slows down evaluation so it's been disabled
      allow-import-from-derivation = false;

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      # use xdg base directories for all the nix things
      use-xdg-base-directories = true;
    };
  };
}
