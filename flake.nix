{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixos-wsl,
    sops-nix,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      debug = true;
      systems = ["x86_64-linux"];
      perSystem = {config, ...}: {};
      flake = {
        # NixOS configuration entrypoint
        # Available through 'nixos-rebuild --flake .#your-hostname'
        nixosConfigurations = {
          wsl-laptop-e431 = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            specialArgs = {
              inherit inputs;
              isWsl = true;
              unstable = import nixpkgs-unstable {
                inherit system;
                config = {
                  allowUnfree = true;
                };
              };
            };
            modules = [
              (
                {pkgs, ...}: {
                  _module.args = {
                    stable = pkgs;
                  };
                }
              )
              ./boxes/wsl-laptop-e431/configuration.nix
              nixos-wsl.nixosModules.wsl
              sops-nix.nixosModules.sops
              inputs.home-manager.nixosModules.default
              inputs.nix-index-database.nixosModules.nix-index
              {programs.nix-index-database.comma.enable = true;}
            ];
          };
        };
      };
    };
}
