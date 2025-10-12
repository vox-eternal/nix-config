{
  lib,
  self,
  config,
  inputs,
  ...
}: {
  imports = [
    ./voxxus.nix
    ./root.nix
  ];

  config = {
    users.mutableUsers = false;
  };
}
