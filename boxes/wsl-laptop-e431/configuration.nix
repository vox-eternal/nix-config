# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  pkgs,
  inputs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
    ../../common/systemModules/crypt.nix
    # USERS
    ../../common/users/voxxus-wsl
  ];

  wsl = {
    enable = true;
    defaultUser = "voxxus";
    wslConf = {
      network = {
        hostname = "izar";
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  environment.systemPackages = with pkgs; [
    xclip
    hyfetch
    fastfetch
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.droid-sans-mono
    nerd-fonts.comic-shanns-mono
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh.enable = true;
}
