{
  imports = [
    ./users.nix
  ];

  garden = {
    profiles = {
      graphical.enable = true;
      workstation.enable = true;
    };
  };
}
