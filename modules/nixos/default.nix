{
  _class = "nixos";

  imports = [
    ../base
    ./boot
    ./extras.nix
    ./environment
    ./users
    ./networking
    ./hardware
    ./gaming
    ./programs
    ./system
    ./development
    ./secrets.nix
  ];
}
