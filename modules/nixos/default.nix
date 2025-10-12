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
    ./secrets.nix
  ];
}
