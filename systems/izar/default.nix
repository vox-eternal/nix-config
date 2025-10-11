{
  imports = [./users.nix];

  garden = {
    profiles = {
      workstation.enable = true;
      headless.enable = true;
    };
  };
}
