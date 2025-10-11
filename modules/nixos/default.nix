{
  _class = "nixos";

  imports = [
    ../base
    ./extras.nix
    ./users
    ./secrets.nix
  ];
}
